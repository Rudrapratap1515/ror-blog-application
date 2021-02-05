# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BlogsController, type: :controller do
  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end
  end
  describe 'create blog' do
    it 'creates the blog' do
      post :create, params: { blog: { title: 'Test Title', read_time: '2000-01-01 02:30:00.000000000 +0000', body: 'This is my test Blog', category_id: 1, member_id: 19 } }
      expect(response.status).to eq(302)
    end
  end
  describe 'Show blog' do
    it 'shows the blog' do
      get :show, params: { id: 19 }
      expect(response.status).to eq(200)
    end
  end
  describe 'update blog' do
    it 'updates the blog' do
      # patch :update,  params: params
      patch :update, params: { id: 19, blog: { title: 'Test Title', read_time: '2000-01-01 02:30:00.000000000 +0000', body: 'This is my test Blog', category_id: 1, member_id: 19 } }
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
