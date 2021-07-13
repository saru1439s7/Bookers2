Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'homes/about'=>'homes#about'
  resources :books, only: [:new, :show,:create, :edit,:index,  :update,:destroy] do
  end

  resources :users, only: [:show,:edit,:update,:index,:update,:destroy]
end
