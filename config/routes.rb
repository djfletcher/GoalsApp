Rails.application.routes.draw do
  resources :users, only: [:new, :create] do
    resources :goals, only: [:index]
  end
end
