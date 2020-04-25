Rails.application.routes.draw do
  resources :cocktails, only: %i[index show create new destroy] do
    resources :doses, only: %i[new create destroy]
  end
  resources :ingredients, only: %i[new create]
end
