Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  
  devise_scope :user do
    get 'profile_edit', to: 'users/registrations#profile_edit', as: 'profile_edit'
    patch 'profile_update', to: 'users/registrations#profile_update', as: 'profile_update'
  end
  
  root to: 'home#top' # トップページへは「root」でルーティング指定
  resources :rooms
  resources :reservations
  get 'users/show'
  get 'users', to: 'users#show'
  get 'users/profile'
  # get 'reservations/index'
end
