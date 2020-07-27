require 'rails_helper'

xdescribe "hit sinatra microservice" do 

  before :each do 
    @service = IScreamService.new 
  end

  it "returns keyword info using microservice" do

    spider_json = @service.get_keyid('spider')

    expected_json = {:data=>{:id=>4235, :name=>"spider"}}
    expect(spider_json).to eq(expected_json)
  end

  it "returns key_id info using microservice" do
    spider_json = @service.get_keyword('16')

    expected_json = {:data=>{:id=>16, :name=>"ghosts"}}
    expect(spider_json).to eq(expected_json)
  end

  it "returns game info using microservice" do 
    mk64_json = @service.get_game_exact("Mario%20Kart%2064")

    exp_age_rating = [8]
    exp_release_date = 1996
    exp_cover = "//images.igdb.com/igdb/image/upload/t_thumb/co1te8.jpg"
    exp_popularity = 5.457862054247628
    exp_summary = "Mario Kart 64 is the second main installment of the Mario Kart series. It"
    exp_name = "Mario Kart 64"
    exp_total_rating = 81.79204527809605
    exp_categories = 0
    exp_genres = ["Racing","Sport"]
    exp_keyword1 = 25
    exp_keyword2 = 280
    exp_keyword3 = 281
    exp_platforms = ["Nintendo 64","Wii","Wii U"]
    exp_similars = ["Super Mario Bros.","Crash Team Racing","Crash Nitro Kart","Super Mario Kart","Mario Kart: Super Circuit","Mario Kart DS","Mario Kart 7","Mario Kart 8","Paper Mario: The Thousand-Year Door"]
    exp_screenshot1 = "//images.igdb.com/igdb/image/upload/t_thumb/sc87rl.jpg"
    exp_screenshot2 = "//images.igdb.com/igdb/image/upload/t_thumb/sc87rm.jpg"
    exp_screenshot3 = "//images.igdb.com/igdb/image/upload/t_thumb/sc87rn.jpg"
    exp_themes = ["Action","Kids"]
    exp_videos = "ASWgJvuQhTA"
    
    data = mk64_json[:data]
    expect(data[:age_ratings]).to eq(exp_age_rating)
    expect(data[:release_date]).to eq(exp_release_date)
    expect(data[:cover]).to eq(exp_cover)
    expect(data[:popularity]).to eq(exp_popularity)
    expect(data[:summary]).to include(exp_summary)
    expect(data[:name]).to eq(exp_name)
    expect(data[:total_rating]).to eq(exp_total_rating)
    expect(data[:categories]).to eq(exp_categories)
    expect(data[:genres]).to eq(exp_genres)
    expect(data[:keywords]).to include(exp_keyword1)
    expect(data[:keywords]).to include(exp_keyword2)
    expect(data[:keywords]).to include(exp_keyword3)
    expect(data[:platforms]).to eq(exp_platforms)
    expect(data[:similars]).to eq(exp_similars)
    expect(data[:screenshots]).to include(exp_screenshot1)
    expect(data[:screenshots]).to include(exp_screenshot2)
    expect(data[:screenshots]).to include(exp_screenshot3)
    expect(data[:themes]).to eq(exp_themes)
    expect(data[:videos]).to eq(exp_videos)

  end
  
  
end
