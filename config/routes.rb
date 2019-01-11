# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'pages#show', page: 'sign_in'

  namespace :api do
    namespace :v1 do
      # User actions
      post 'password/forgot', to: 'passwords#forgot'
      post 'password/reset', to: 'passwords#reset'
      get    '/users'          => 'users#index'
      get    '/users/current'  => 'users#current'
      post   '/users/create'   => 'users#create'
      patch  '/user/:id'       => 'users#update'
      delete '/user/:id'       => 'users#destroy'
      get    'auth'            => 'home#auth'
      get 'all'                => 'home#all'
      # Get login token from Knock
      post 'user_token' => 'user_token#create'
      
      # api for slider
      get 'sliders', to: 'sliders#index'
      get 'sliders/:id', to: 'sliders#show'
      post 'sliders', to: 'sliders#create'
      put 'sliders/:id', to: 'sliders#update'
      delete 'sliders/:id', to: 'sliders#destroy'
    end
  end
end
