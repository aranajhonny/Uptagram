Rails.application.routes.draw do

  
devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }
get 'photos' => 'photos#index'
get "/auth/:provider/callback" => "sessions#create_from_omniauth"

get "/static/:page" => "static#show"


resources :categories


root to: 'photos#index'
resources :categories


resources :photos do
  member do
    post 'like'
  end
  resources :comments
  
end

devise_scope :user do
  resources :users
end

end
