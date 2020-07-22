Rails.application.routes.draw do
    get "/", to: "welcome#index"
    get "/games/:game_id", to: "games#show"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
