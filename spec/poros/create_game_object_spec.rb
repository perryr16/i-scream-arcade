require 'rails_helper'

describe "create Game and assocaited objects from API call" do 

  before :each do 
    @results = IScreamResults.new
  end

  it "creates Mario Kart 64 and associated Objects" do
    @results.create_game_objects("Mario%20Kart%2064")
    mk64 = Game.last 

    exp_summary = "Mario Kart 64 is the second main installment of the Mario Kart series. It is the first game in the series to use three-dimensional graphics, however, the characters and items in this game are still two-dimensional, pre-rendered sprites. The game offers two camera angles and three engine sizes: 50cc, 100cc and 150cc. Each kart has distinctive handling, acceleration and top speed capabilities. Shells that you fire at rival racers, Bananas that make them skid out and Lightning Bolts that make them small and very slow are just a few of the game's unique power-ups."
    expect(mk64.name).to eq("Mario Kart 64")
    expect(mk64.age_rating).to eq(8)
    expect(mk64.cover).to eq("https://images.igdb.com/igdb/image/upload/t_thumb/co1te8.jpg")
    expect(mk64.popularity).to eq(5.5)
    expect(mk64.summary).to eq(exp_summary)
    expect(mk64.release_date).to eq('1996')
    expect(mk64.total_rating).to eq(81.8)
    expect(mk64.video).to eq("https://www.youtube.com/watch?v=ASWgJvuQhTA")
    
    # categories (empty)
    # Genres
    expect(mk64.genres.length).to eq(2)
    expect(mk64.genres[0].genre).to eq('Racing')
    expect(mk64.genres[1].genre).to eq('Sport')

    # Keywords 
    expect(mk64.keywords.length).to eq(132)
    expect(mk64.keywords[0].keyword).to eq ('25')

    # Platforms 
    expect(mk64.platforms.length).to eq(3)
    expect(mk64.platforms[0].platform).to eq("Nintendo 64")
    expect(mk64.platforms[1].platform).to eq("Wii")
    expect(mk64.platforms[2].platform).to eq("Wii U")

    # Screenshots 
    expect(mk64.screenshots.length).to eq(7)
    expect(mk64.screenshots[0].screenshot).to eq("https://images.igdb.com/igdb/image/upload/t_thumb/sc87rl.jpg")

    # Similar Games 
    expect(mk64.similars.length).to eq(9)
    expect(mk64.similars[0].game).to eq("Super Mario Bros.")
    expect(mk64.similars[2].game).to eq("Crash Nitro Kart")

    # Themes 
    expect(mk64.themes.length).to eq(2)
    expect(mk64.themes[0].theme).to eq('Action')
    expect(mk64.themes[1].theme).to eq('Kids')

  end
  
end