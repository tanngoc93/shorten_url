Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post :encode, to: "encode#create"
      get  :decode, to: "decode#show"
    end
  end

  # Defines the root path route ("/")
  root "home#index"
end
