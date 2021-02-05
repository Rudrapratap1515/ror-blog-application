# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MembersController, type: :controller do
  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(302)
    end
  end
  describe 'create member' do
    it 'creates the member' do
      post :create, params: { member: { name: 'Chinu', password: '8005503199', email: 'chinu@example.com', age: 21, role_id: 1, address: '200-B BLock Meera Nagar Bhuwana', contact: '9413552756' } }
      expect(response.status).to eq(302)
    end
  end
  describe 'Show Member' do
    it 'shows the member' do
      get :show, params: { id: 19 }
      expect(response.status).to eq(302)
    end
  end
  describe 'update member' do
    it 'updates the member' do
      # patch :update,  params: params
      patch :update, params: { id: 19, member: { name: 'Chinu', password: '8005503199', email: 'chinu@example.com', age: 22, role_id: 1, address: '200-B BLock Meera Nagar Bhuwana', contact: '9413552756' } }
      expect(response.status).to eq(302)
    end
  end
  describe 'destroy blog' do
    it 'destroys the blog' do
      # patch :update,  params: params
      delete :destroy, params: { id: 19 }
      expect(response.status).to eq(302)
    end
  end
end
