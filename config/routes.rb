Rails.application.routes.draw do
    get "/", to: "welcome#index"
    get "/quiz", to: "fear_quiz#new"
    post "/game-search", to: "game_search#index"

    resources :games, only: [:index]
    resources :user_games, only: [:create]

    resources :results, only: [:index]

end
