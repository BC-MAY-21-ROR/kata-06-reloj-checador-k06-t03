# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :employees
  get 'loginE', to: 'employees#login'
  post 'loginE', to: 'employees#checkIn'
  get 'logoutE', to: 'employees#login'
  post 'logoutE', to: 'employees#logout'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  post 'login', to: 'sessions#create'

  resources :reports
  resources :companies
  resources :admins
  resources :administrators

  root 'sessions#new'
end
