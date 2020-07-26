Rails.application.routes.draw do
    get "/", to: "welcome#index"
    get "/quiz", to: "fear_quiz#new"

    post "/game-search", to: "game_search#index"
    post "/game-search", to: "game_search#show"
    
    get 'auth/:provider/callback', to: 'sessions#create'
    get '/logout', to: 'sessions#destroy'

    resources :games, only: [:index, :show]
    resources :user_games, only: [:create, :destroy]
    resources :results, only: [:index]

    get '/profile', to: 'users#show'
    resources :users, only: [:edit, :update]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
