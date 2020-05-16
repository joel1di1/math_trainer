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

RSpec.describe '/problems', type: :request do # rubocop:disable Metrics/BlockLength
  # Problem. As you add validations to Problem, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Problem.create! valid_attributes
      get problems_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      problem = Problem.create! valid_attributes
      get problem_url(problem)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_problem_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      problem = Problem.create! valid_attributes
      get edit_problem_url(problem)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Problem' do
        expect do
          post problems_url, params: { problem: valid_attributes }
        end.to change(Problem, :count).by(1)
      end

      it 'redirects to the created problem' do
        post problems_url, params: { problem: valid_attributes }
        expect(response).to redirect_to(problem_url(Problem.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Problem' do
        expect do
          post problems_url, params: { problem: invalid_attributes }
        end.to change(Problem, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post problems_url, params: { problem: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested problem' do
        problem = Problem.create! valid_attributes
        patch problem_url(problem), params: { problem: new_attributes }
        problem.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the problem' do
        problem = Problem.create! valid_attributes
        patch problem_url(problem), params: { problem: new_attributes }
        problem.reload
        expect(response).to redirect_to(problem_url(problem))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        problem = Problem.create! valid_attributes
        patch problem_url(problem), params: { problem: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested problem' do
      problem = Problem.create! valid_attributes
      expect do
        delete problem_url(problem)
      end.to change(Problem, :count).by(-1)
    end

    it 'redirects to the problems list' do
      problem = Problem.create! valid_attributes
      delete problem_url(problem)
      expect(response).to redirect_to(problems_url)
    end
  end
end
