Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :users, except: [:index, :edit, :new] do
      post :login, on: :collection
    end
  end
end
