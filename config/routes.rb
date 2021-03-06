Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items do
    resources :pickups, only: [:new, :create]
  end
  resources :pickups, only: [:show] do
    patch :mark
  end
  resources :users, only: [:show, :edit, :update]
  resource :dashboard, only: [:show]
end
