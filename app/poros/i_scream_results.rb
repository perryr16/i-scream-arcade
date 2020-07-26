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

    category_objects(data, game)
    genre_objects(data, game)
    keyword_objects(data, game)
    platform_objects(data, game)
    screenshot_objects(data, game)
    similar_objects(data, game)
    theme_objects(data, game)
    video_object(data, game)
  end

  def game_object(data)
    Game.create(new_game_params(data))
  end

  # def generate_game_related_object(data, game, attribute)
  #   PROBLEM: need a plural and a singlular, apporaching unreadable

  #   return nil if !data[attribute].is_a?(Array)
  #   data[attribute].each do |value|
  #   binding.pry
  #     game.cateogries.create(attribute => value)
  #   end
  # end

  def category_objects(data, game)
    return nil if !data[:categories].is_a?(Array)
    data[:categories].each do |category|
      game.cateogries.create(category: category)
    end
  end

  def genre_objects(data, game)
    return nil if !data[:genres].is_a?(Array)
    data[:genres].each do |genre|
      game.genres.create(genre: genre)
    end
  end

  def keyword_objects(data, game)
    return nil if !data[:keywords].is_a?(Array)
    data[:keywords].each do |keyword|
      game.keywords.create(keyword: keyword)
    end
  end

  def platform_objects(data, game)
    return nil if !data[:platforms].is_a?(Array)
    data[:platforms].each do |platform|
      game.platforms.create(platform: platform)
    end
  end

  def similar_objects(data, game)
    return nil if !data[:similars].is_a?(Array)
    data[:similars].each do |similar|
     game.similars.create(game: similar)
    end
  end

  def theme_objects(data, game)
    return nil if !data[:themes].is_a?(Array)
    data[:themes].each do |theme|
     game.themes.create(theme: theme)
    end
  end

  def video_object(data, game)
    Video.create(video: data[:videos], game_id: game.id) if data[:videos]
  end 

  def screenshot_objects(data, game)
    return nil if !data[:screenshots].is_a?(Array)
    data[:screenshots].each do |screenshot|
     game.screenshots.create(screenshot: screenshot)
    end
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