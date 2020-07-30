Rails.application.routes.draw do
    get "/", to: "welcome#index"
    get "/quiz", to: "fear_quiz#new"

    # post "/game-search", to: "game_search#index"
    # get '/game_search/:id', to: "game_search#show"
    post "/game_search", to: "game_search#create"
    resources :game_search, only: [:index, :show]

    get 'auth/:provider/callback', to: 'sessions#create'
    get '/logout', to: 'sessions#destroy'

    get '/games/:game_id/review', to: 'reviews#new'
    post '/games/:game_id', to: 'reviews#create'
    get '/games/game_id/reviews/:id', to: 'reviews#edit'

    resources :games, only: [:index, :show]
    resources :user_games, only: [:create, :destroy]
    resources :results, only: [:index]

    get '/profile', to: 'users#show'
    resources :users, only: [:edit, :update]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
