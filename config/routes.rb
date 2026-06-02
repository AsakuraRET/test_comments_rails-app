Rails.application.routes.draw do
  devise_for :users

  resources :comments, only: [:index, :create, :edit, :update, :destroy] do
    collection do
      get :search 
    end
  end

  resources :notifications, only: [:index] do
    member do
      patch :mark_as_read 
    end
  end

  root "comments#index"
end
