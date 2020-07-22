class Favorite 

  attr_reader :contents
  def initialize(initial_contents)
    @contents = initial_contents || Hash.new(0)
  end

  def add_game(id)

  end

end