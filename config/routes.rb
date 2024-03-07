Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check
  resources :weddings, except: :show do
    resources :guests, only: %i[new create edit update destroy]
    delete "delete_all_guests", to: "guests#delete_all"
    resources :gifts, only: %i[new create edit update destroy] do
      resources :orders, only: %i[new create]
    end
    delete "delete_all_gifts", to: "gifts#delete_all"
    resources :tips, only: %i[new create edit update destroy]
  end

  get ":wedding_id/:couple", to: "weddings#show", as: :wedding_info
  get ":wedding_id/:couple/presentes", to: "gifts#index", as: :presentes
  get "users/:id/profile", to: "users#show", as: :user_profile
end
