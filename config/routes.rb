Rails.application.routes.draw do
  root "princess_robots#index"

  resources :princess_robots, only: [:index, :show, :new, :create] do
    resources :mentees, only: [:index, :new, :create]
  end
end
