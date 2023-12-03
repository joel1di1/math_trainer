# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/fights' do
  # This should return the minimal set of attributes required to create a valid
  # Fight. As you add validations to Fight, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Fight.create! valid_attributes
      get fights_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      fight = Fight.create! valid_attributes
      get fight_url(fight)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_fight_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      fight = Fight.create! valid_attributes
      get edit_fight_url(fight)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Fight' do
        expect do
          post fights_url, params: { fight: valid_attributes }
        end.to change(Fight, :count).by(1)
      end

      it 'redirects to the created fight' do
        post fights_url, params: { fight: valid_attributes }
        expect(response).to redirect_to(fight_url(Fight.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Fight' do
        expect do
          post fights_url, params: { fight: invalid_attributes }
        end.not_to change(Fight, :count)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post fights_url, params: { fight: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested fight' do
        fight = Fight.create! valid_attributes
        patch fight_url(fight), params: { fight: new_attributes }
        fight.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the fight' do
        fight = Fight.create! valid_attributes
        patch fight_url(fight), params: { fight: new_attributes }
        fight.reload
        expect(response).to redirect_to(fight_url(fight))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        fight = Fight.create! valid_attributes
        patch fight_url(fight), params: { fight: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested fight' do
      fight = Fight.create! valid_attributes
      expect do
        delete fight_url(fight)
      end.to change(Fight, :count).by(-1)
    end

    it 'redirects to the fights list' do
      fight = Fight.create! valid_attributes
      delete fight_url(fight)
      expect(response).to redirect_to(fights_url)
    end
  end
end
