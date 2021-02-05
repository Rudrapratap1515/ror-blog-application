# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'logs in and logs out' do
    it 'logs in to app' do
      post :create, params: { session: { email: 'chinu@example.com', password: '8005503199' } }
      expect(response).to redirect_to('/blogs')
      # expect(response.status).to eq(204)
    end
    it 'logs out from app' do
      session[:current_user_id] = 19
      post :destroy
      expect(response).to redirect_to('/sessions/new')
    end
  end
end
