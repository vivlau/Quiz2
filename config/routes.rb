Rails.application.routes.draw do

  resources :ideas do
    resources :reviews
  end

  get "idea/new" => 'idea#new', :as => :new

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  root 'ideas#index'
end
