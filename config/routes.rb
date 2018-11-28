# frozen_string_literal: true

Rails.application.routes.draw do
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
      # Get login token from Knock
      post 'user_token' => 'user_token#create'
    end
  end
end
