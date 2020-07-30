class IScreamResults

  def service
    IScreamService.new
  end

  def game_params(game_name)
    game_name = game_name.gsub(" ", "%20")
    service.get_game_exact(game_name)
  end

  def existing_game(game_name)
    Game.find_by(name: game_name)
  end

  

  def create_game_objects(game_name)
    return game_params(game_name) if game_params(game_name).is_a?(String)
    return existing_game(game_name) if existing_game(game_name)
    data = game_params(game_name)[:data]
    game = game_object(data)

    category_objects(data, game)
    genre_objects(data, game)
    keyword_objects(data, game)
    platform_objects(data, game)
    screenshot_objects(data, game)
    similar_objects(data, game)
    theme_objects(data, game)
    game
  end

  def game_object(data)
    Game.create(new_game_params(data))
  end

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

  def screenshot_objects(data, game)
    return nil if !data[:screenshots].is_a?(Array)
    data[:screenshots].each do |screenshot|
     game.screenshots.create(screenshot: screenshot)
    end
  end

  def age_ratings(data)
    return nil if !data[:age_ratings].is_a?(Array)
    data[:age_ratings][0]
  end

  def new_game_params(data)
    {
      age_rating:         age_ratings(data),
      cover:              data[:cover],
      popularity:         data[:popularity].to_i,
      summary:            data[:summary],
      release_date:       data[:release_date],
      name:               data[:name],
      total_rating:       data[:total_rating].to_i,
      video:              data[:video]
    }
  end

  def games_by_keywords(keywords)
    results = service.get_games_by_keywords(keywords)
    return results if results.is_a?(String)
    results[:data].map do |api_return|
      data = api_return[:data]
      game = game_object(data)

      category_objects(data, game)
      genre_objects(data, game)
      keyword_objects(data, game)
      platform_objects(data, game)
      screenshot_objects(data, game)
      similar_objects(data, game)
      theme_objects(data, game)
      game
    end
  end
end
