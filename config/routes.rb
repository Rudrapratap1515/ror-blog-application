# frozen_string_literal: true

Rails.application.routes.draw do
  get 'sessions/new'
  resources :blogs
  resources :categories
  resources :members
  root 'blogs#index'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
