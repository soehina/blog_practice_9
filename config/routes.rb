Rails.application.routes.draw do
  devise_scope :user do
    get '/' => 'posts#index'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :posts
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end