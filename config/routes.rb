# frozen_string_literal: true

Rails.application.routes.draw do
  get 'deals/new'
  get 'groups/index'
  get 'groups/new'
  get 'groups/show'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
