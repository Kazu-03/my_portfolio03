Rails.application.routes.draw do
  resources :posts
  devise_for :users

  root 'blogs#index'

  resources :blogs, only: [:index,:new, :create, :destroy, :edit, :update, :show] do
    collection do 
    get "search"
  end
  end

  resources :users, only: [:edit, :show] do
  end

  resources :posts, only: [:index,:new, :create, :destroy, :edit, :update, :show] do  
  end
end
