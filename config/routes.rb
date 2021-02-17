Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  resources :posts
  resources :likes, only: [:create, :destroy]
  root "posts#index"
  # post '/posts/guest_sign_in', to: 'posts#new_guest'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
