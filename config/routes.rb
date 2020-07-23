Rails.application.routes.draw do
    get "/", to: "welcome#index"
    get "/quiz", to: "fear_quiz#new"
    post "/game-search", to: "game_search#show"

    resources :games, only: [:index]
    resources :user_games, only: [:create]
    resources :results, only: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
