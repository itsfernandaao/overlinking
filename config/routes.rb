Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get '/feed', to: 'feed#index'
end
