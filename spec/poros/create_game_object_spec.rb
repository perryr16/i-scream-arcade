require 'rails_helper'

describe "create Game and assocaited objects from API call" do 

  before :each do 
    @results = IScreamResults.new
  end

  it "creates Mario Kart 64 and associated Objects" do
    @results.game_object("Mario%20Kart%2064")
    mk64 = Game.last 

    exp_summary = "Mario Kart 64 is the second main installment of the Mario Kart series. It is the first game in the series to use three-dimensional graphics, however, the characters and items in this game are still two-dimensional, pre-rendered sprites. The game offers two camera angles and three engine sizes: 50cc, 100cc and 150cc. Each kart has distinctive handling, acceleration and top speed capabilities. Shells that you fire at rival racers, Bananas that make them skid out and Lightning Bolts that make them small and very slow are just a few of the game's unique power-ups."
    expect(mk64.name).to eq("Mario Kart 64")
    expect(mk64.age_rating).to eq(8)
    expect(mk64.cover).to eq("//images.igdb.com/igdb/image/upload/t_thumb/co1te8.jpg")
    expect(mk64.popularity).to eq(5.5)
    expect(mk64.summary).to eq(exp_summary)
    expect(mk64.release_date).to eq('1996')
    expect(mk64.total_rating).to eq(81.8)
  end
  
  
end