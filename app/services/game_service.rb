class GameService

  # def conn
  #   Faraday.new('http://localhost:4567')
  # end

  def encode_url(game_name)
    url = "http://localhost:4567/game/#{game_name}"
    encoded_url = URI.encode(url)
    URI.parse(encoded_url)
  end
  def conn(game_name)
    Faraday.new(encode_url(game_name))
  end

  def get_game(game_name)
    response = conn.get("/game/#{game_name}")
  end

  # def get_games
  #   response = conn.get('/games') do |res|
  #     res.body = 'fields *;'
  #   end
  #   body = JSON.parse(response.body)
  # end

  # def get_game_videos(game_id)
  #   response = conn.get("/game_videos") do |res|
  #     res.body = "fields *; where id = #{game_id};"
  #   end
  #   body = JSON.parse(response.body)
  # end
  
end
  