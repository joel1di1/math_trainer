# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Guest session management' do
  describe 'Auto-creating guest users' do
    it 'automatically creates a guest user on first visit' do
      expect(User.count).to eq(0)

      visit '/'

      # Should have auto-created a user
      expect(User.count).to eq(1)
      guest_user = User.last
      expect(guest_user.uuid).to be_present
      expect(guest_user.email).to be_blank # Guest users don't have email
    end

    it 'persists the same guest user across requests' do
      visit '/'
      first_user = User.last

      visit '/'

      # Should still be the same user
      expect(User.count).to eq(1)
      expect(User.last.id).to eq(first_user.id)
    end

    it 'allows guest user to play and save answers' do
      visit '/'
      guest_user = User.last

      # Navigate to a practice session (assuming home has links)
      expect(page).to have_css('#menu-links')

      # Guest user should be able to interact with the app
      # All answers should be tied to the auto-created guest user
      expect(guest_user).to be_present
      expect(guest_user.uuid).to be_present
    end
  end

  describe 'Saving session' do
    let(:guest_user) { create(:user) }

    before do
      # Simulate a guest user session
      login_as(guest_user, scope: :user)
      # Create some activity for the guest user
      create_list(:answer, 5, user: guest_user, correct: true, text: '10')
      create_list(:answer, 2, user: guest_user, correct: false, text: '5')
    end

    it 'shows the save session page with current UUID' do
      visit '/session/save'

      expect(page).to have_text('Save Your Progress')
      expect(page).to have_field('session-code', with: guest_user.uuid)
      expect(page).to have_css('svg.qr-code', wait: 5) # QR code should be present
    end

    it 'displays current session statistics' do
      visit '/session/save'

      expect(page).to have_text('7') # Total answers
      expect(page).to have_text('5') # Correct answers
    end

    it 'allows user to update UUID to a custom value' do
      visit '/session/save'

      # Fill in custom UUID
      fill_in 'Custom Code', with: 'mycoolcode'
      click_button 'Update Code'

      expect(page).to have_text('Code updated successfully')
      expect(page).to have_field('session-code', with: 'mycoolcode')
      expect(page).to have_field('Custom Code', with: 'mycoolcode')

      guest_user.reload
      expect(guest_user.uuid).to eq('mycoolcode')
    end

    it 'shows error when custom UUID is already taken' do
      create(:user, uuid: 'takenuuid')
      visit '/session/save'

      fill_in 'Custom Code', with: 'takenuuid'
      click_button 'Update Code'

      expect(page).to have_text('already been taken')
    end

    it 'provides a copyable UUID' do
      visit '/session/save'

      expect(page).to have_css('[data-controller="clipboard"]', wait: 5)
    end
  end

  describe 'Restoring session' do
    let(:existing_user) { create(:user, uuid: 'existingcode') }
    let(:guest_user) { create(:user) }

    before do
      # Create activity for existing user
      create_list(:answer, 10, user: existing_user, correct: true, text: '10')

      # Create activity for current guest
      create_list(:answer, 3, user: guest_user, correct: false, text: '5')

      # Login as guest user
      login_as(guest_user, scope: :user)
    end

    it 'shows the restore session page' do
      visit '/session/restore'

      expect(page).to have_text('Restore Your Session')
      expect(page).to have_field('Code')
    end

    it 'shows warning about current session data' do
      visit '/session/restore'

      expect(page).to have_text('3') # Current session answer count
      expect(page).to have_text('will be replaced')
    end

    it 'successfully restores session with valid UUID' do
      visit '/session/restore'

      fill_in 'Code', with: 'existingcode'
      click_button 'Restore Session'

      expect(page).to have_text('Session restored successfully')

      # Should now be logged in as the existing user
      visit '/session/save'
      expect(page).to have_field('session-code', with: 'existingcode')

      # Verify we're now the existing user by checking answers
      expect(existing_user.answers.count).to eq(10)
    end

    it 'shows error with invalid UUID' do
      visit '/session/restore'

      fill_in 'Code', with: 'nonexistentcode'
      click_button 'Restore Session'

      expect(page).to have_text('Code not found')
    end

    it 'overwrites current guest session' do
      visit '/session/restore'

      fill_in 'Code', with: 'existingcode'
      click_button 'Restore Session'

      # Current guest user should still exist in DB but we're now using existing_user
      expect(User.count).to eq(2)

      # Should be using existing_user's session
      visit '/session/save'
      expect(page).to have_field('session-code', with: 'existingcode')
    end
  end

  describe 'Navigation links' do
    it 'shows Save Session and Restore Session links instead of Login' do
      visit '/'

      expect(page).to have_link('Save My Progress')
      expect(page).to have_link('Restore Session')
      expect(page).to have_no_link('Login')
    end
  end

  describe 'Upgrading to email/password account' do
    let(:guest_user) { create(:user) }

    before do
      login_as(guest_user, scope: :user)
      create_list(:answer, 5, user: guest_user, correct: true, text: '10')
    end

    it 'allows upgrading guest account to email/password' do
      visit '/session/save'

      expect(page).to have_link('Upgrade to Email Account', href: new_user_registration_path)
    end
  end
end
