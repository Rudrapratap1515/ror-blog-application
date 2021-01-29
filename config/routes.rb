Rails.application.routes.draw do
  get 'my_blogs/index'
  get 'sessions/new'
  resources :blogs
  resources :categories
  resources :members
  root 'blogapp#index'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
