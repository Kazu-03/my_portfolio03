Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'blogs#index'

  resources :blogs, only: [:index,:new, :create, :destroy, :edit, :update, :show] do
  end

  resources :users, only: [:new] do
    member do
      get 'logout'
    end
  end
end
