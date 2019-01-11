# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'pages#show', page: 'sign_in'

  namespace :api do
    namespace :v1 do
      # user_action product_detail
      get 'prodinvests', to: 'product_invests#index'
      get 'prodinvest/:id', to: 'product_invests#show'
      get 'proinvdetail/:id', to: 'product_invest_details#show'

      resources :products
      resources :product_types
      resources :provinces
      resources :regionals

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

      # routes for user investor
      get 'userinvest', to: 'user_investors#index'
      get 'userinvest/:id', to: 'user_investors#show'
      post 'userinvest', to: 'user_investors#create'
      put 'userinvest/:id', to: 'user_investors#update'
      delete 'userinvest/:id', to: 'user_investors#destroy'
      # routes for user investor detail
      get 'investordetail', to: 'investor_details#index'
      get 'investordetail/:id', to: 'investor_details#show'
      post 'investordetail', to: 'investor_details#create'
      # routes for API enum
      get 'enum/id_card_type', to: 'enum#id_card_type'
      get 'enum/income_resource', to: 'enum#income_resource'
      get 'enum/salary_range', to: 'enum#salary_range'
    end
  end
end


