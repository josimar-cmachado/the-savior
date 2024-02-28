Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :weddings, except: :show do
    resources :guests, only: %i[new create edit update destroy]
    resources :gifts, only: %i[new create edit update destroy] do
      resources :orders, only: %i[new create]
    end
  end
  get ":wedding_id/:couple", to: "weddings#show", as: :wedding_info
  get "users/:id/profile", to: "users#show", as: :user_profile
end
