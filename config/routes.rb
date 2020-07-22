Rails.application.routes.draw do
    get "/", to: "welcome#index"

    resources :games, only: [:index]
    resources :user_games, only: [:create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
