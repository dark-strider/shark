Shark::Application.routes.draw do
  root to: 'home#index'

  devise_for :users
  resources :news, only: [:index, :show]
  resources :photos, only: [:create, :destroy]
  resources :spots, only: :show
  resources :checkins, only: [:create, :update]

  namespace :admin do
    root to: 'dashboard#index'
    resources :energetics
    resources :countries
    resources :checkins
    resources :stickers
    resources :socials
    resources :cities
    resources :users
    resources :spots
    resources :pages
    resources :news
  end

  mount RedactorRails::Engine => '/redactor_rails'
  get ':id', to: 'pages#show', as: :page
end