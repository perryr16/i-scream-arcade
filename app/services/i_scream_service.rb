class IScreamService 

  def get_keyid(keyword)
    response = conn.get("/keyword/#{keyword}")
    json_parse(response)
  end

  def get_keyword(keyid)
    response = conn.get("/keyid/#{keyid}")
    json_parse(response)
  end

  def get_game_exact(game_name)
    response = conn.get("/game/#{game_name}")
    json_parse(response)
  end

  def get_games_by_keywords(keywords)
    response = conn.get("/keywords_to_games/#{keywords}")
    json_parse(response)
  end

  private 

  def conn 
    Faraday.new('https://i-scream-microservice.herokuapp.com') do |faraday|
      faraday.options[:timeout] = 300
    end 
  end

  def json_parse(response)
    return 404 if response.status != 200
    return "No Game Data For Specified Title" if response.body == '<h1>Internal Server Error</h1>'
    JSON.parse(response.body, symbolize_names: true)
  end
end

