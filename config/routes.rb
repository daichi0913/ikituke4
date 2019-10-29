Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  get "show_tweets" => "tweets#show_tweets"
    resources :tweets do
    resources :comments, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    end
end
