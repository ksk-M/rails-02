Rails.application.routes.draw do
  get '/', to: 'home#top'
  devise_for :users
end
