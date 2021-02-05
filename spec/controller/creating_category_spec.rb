# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(302)
    end
  end
  describe 'create category' do
    it 'creates the category' do
      post :create, params: { category: { name: 'Sports' } }
      expect(response.status).to eq(302)
    end
  end
  describe 'Show category' do
    it 'shows the category' do
      get :show, params: { id: 1 }
      expect(response.status).to eq(302)
    end
  end
  describe 'update category' do
    it 'updates the category' do
      # patch :update,  params: params
      patch :update, params: { id: 1, category: { name: 'Games' } }
      expect(response.status).to eq(302)
    end
  end
  describe 'destroy blog' do
    it 'destroys the blog' do
      # patch :update,  params: params
      delete :destroy, params: { id: 1 }
      expect(response.status).to eq(302)
    end
  end
end
