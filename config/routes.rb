Rails.application.routes.draw do
  resources :comments
  get 'pages/about'
  get 'pages/contact'
  get 'pages/resources'
  # get 'categories/index'
  # get 'categories/edit'
  # get 'categories/new'
  # get 'categories/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "home/index"
    resources :categories
    resources :posts
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  get '/resources', to: 'pages#resources'
  root "home#index"
  # ActiveAdmin routing
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
