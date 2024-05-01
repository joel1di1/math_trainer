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

RSpec.describe '/fight_opponents' do
  before { sign_in(create(:user)) }

  # This should return the minimal set of attributes required to create a valid
  # FightOpponent. As you add validations to FightOpponent, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      FightOpponent.create! valid_attributes
      get fight_opponents_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      fight_opponent = FightOpponent.create! valid_attributes
      get fight_opponent_url(fight_opponent)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_fight_opponent_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      fight_opponent = FightOpponent.create! valid_attributes
      get edit_fight_opponent_url(fight_opponent)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new FightOpponent' do
        expect do
          post fight_opponents_url, params: { fight_opponent: valid_attributes }
        end.to change(FightOpponent, :count).by(1)
      end

      it 'redirects to the created fight_opponent' do
        post fight_opponents_url, params: { fight_opponent: valid_attributes }
        expect(response).to redirect_to(fight_opponent_url(FightOpponent.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new FightOpponent' do
        expect do
          post fight_opponents_url, params: { fight_opponent: invalid_attributes }
        end.not_to change(FightOpponent, :count)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post fight_opponents_url, params: { fight_opponent: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested fight_opponent' do
        fight_opponent = FightOpponent.create! valid_attributes
        patch fight_opponent_url(fight_opponent), params: { fight_opponent: new_attributes }
        fight_opponent.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the fight_opponent' do
        fight_opponent = FightOpponent.create! valid_attributes
        patch fight_opponent_url(fight_opponent), params: { fight_opponent: new_attributes }
        fight_opponent.reload
        expect(response).to redirect_to(fight_opponent_url(fight_opponent))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        fight_opponent = FightOpponent.create! valid_attributes
        patch fight_opponent_url(fight_opponent), params: { fight_opponent: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested fight_opponent' do
      fight_opponent = FightOpponent.create! valid_attributes
      expect do
        delete fight_opponent_url(fight_opponent)
      end.to change(FightOpponent, :count).by(-1)
    end

    it 'redirects to the fight_opponents list' do
      fight_opponent = FightOpponent.create! valid_attributes
      delete fight_opponent_url(fight_opponent)
      expect(response).to redirect_to(fight_opponents_url)
    end
  end
end
