class GameService

  def conn 
    Faraday.new('https://api-v3.igdb.com') do |res|
      res.headers["user-key"] = ENV['GAME_API']
    end
  end

  def get_games
    response = conn.get('/games') do |res|
      res.body = 'fields *;'
    end
    body = JSON.parse(response.body)
  end

  def get_game_videos(game_id)
    response = conn.get("/game_videos") do |res|
      res.body = "fields *; where id = #{game_id};"
    end
    body = JSON.parse(response.body)
  end
  
end
  