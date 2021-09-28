Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get '/feed', to: 'feed#index'
  resources :trails, only: [:index, :new, :create] do
    resources :overlinks, only: [:new, :create]
    patch '/public', to: 'trails#set_public'
    patch '/private', to: 'trails#set_private'
  end
end
