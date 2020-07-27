class IScreamService 

  def conn 
    Faraday.new('http://localhost:9393')
  end

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

  def json_parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
