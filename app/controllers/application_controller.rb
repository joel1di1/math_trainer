# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_current_user

  private

  def set_current_user
    # If user is already signed in via Devise, use that
    return if user_signed_in?

    # Otherwise, get or create guest user
    current_or_guest_user
  end

  def current_or_guest_user
    # Check if we have a guest UUID in cookies
    guest_uuid = cookies.encrypted[:guest_user_uuid]

    if guest_uuid.present?
      # Try to find user by UUID
      user = User.find_by(uuid: guest_uuid)
      if user
        sign_in(user, store: false)
        return user
      end
    end

    # Create new guest user
    create_guest_user
  end

  def create_guest_user
    user = User.create!(
      uuid: SecureRandom.uuid,
      email: nil,
      password: SecureRandom.hex(20)
    )

    # Store UUID in encrypted cookie (permanent, won't expire)
    cookies.encrypted.permanent[:guest_user_uuid] = user.uuid

    # Sign in the user
    sign_in(user, store: false)

    user
  end

  # Override current_user to ensure we always have a user
  def current_user
    super || current_or_guest_user
  end
end
