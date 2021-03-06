Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'privacy', to: 'pages#privacy'
  get 'autocomplete', to: 'insta_users#autocomplete' #does not work...
  resources :fights, only: [:index, :new, :show, :create]
  resources :insta_users, only: [:index, :new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
