Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  resources :posts
  resources :likes, only: [:create, :destroy]
  root "posts#index"
  devise_scope :user do
     post 'users/guest_sign_in', to: 'users/sessions#new_guest'
   end
  # post '/posts/guest_sign_in', to: 'posts#new_guest'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
