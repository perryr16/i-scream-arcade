class IScreamResults 

  def service
    IScreamService.new
  end

  def game_params(game_name)
    params = service.get_game_exact(game_name)
  end

  def game_object(game_name)
    params = game_params(game_name)
    Game.create(new_game_params(params))
  end


  def new_game_params(params)
    # game_keys = Game.columns.map { |column| column.name.to_sym }
    # game_vals = game_keys.map {|key| params[:data][key]}
    data = params[:data]
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