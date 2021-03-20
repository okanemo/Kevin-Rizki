Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :patient_labs, only: [:create]
  end
end