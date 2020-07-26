class IScreamResults 

  def service
    IScreamService.new
  end

  def game_params(game_name)
    service.get_game_exact(game_name)
  end

  def create_game_objects(game_name)
    data = game_params(game_name)[:data]
    game_object(data)
    game = Game.last
    category_object(data, game)
    genre_object(data, game)
  end

  def game_object(data)
    Game.create(new_game_params(data))
  end

  def category_object(data, game)
    return nil if !data[:categories].is_a?(Array)
    data[:categories].each do |category|
      game.cateogries.create(category: category)
    end
  end

  def genre_object(data, game)
    return nil if !data[:genres].is_a?(Array)
    data[:genres].each do |genre|
      game.genres.create(genre: genre)
    end
  end

  def keywords(data, game)

  end


  def new_game_params(data)
    # game_keys = Game.columns.map { |column| column.name.to_sym }
    # game_vals = game_keys.map {|key| params[:data][key]}
    {
      age_rating:         data[:age_ratings][0],
      cover:              data[:cover],
      popularity:         data[:popularity].round(1),
      summary:            data[:summary],
      release_date:       data[:release_date],
      name:               data[:name],
      total_rating:       data[:total_rating].round(1)
    }
  end
end