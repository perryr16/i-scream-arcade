FactoryBot.define do
  factory :user do
    name { Faker::Movies::Ghostbusters.character }
    google_token { rand(10000000..999999999) }
    email { "#{Faker::Creature::Animal.name}@gmail.com" }
    photo_array = ["https://i.dlpng.com/static/png/4467625-video-game-characters-that-are-blue-gamer-problems-png-video-game-character-1000_1024_preview.webp",
    "https://www.nicepng.com/png/detail/94-942332_endearing-video-game-characters-that-you-cannot-stand.png",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQaZwFBWHo6k-iya69x6OLiNmywhY4t2YzTew&usqp=CAU",
    "https://www.pngkit.com/png/full/76-763842_adewale-1-render-by-quidek-d8fs7gj-video-game.png",
    "https://p7.hiclipart.com/preview/924/660/881/2d-computer-graphics-video-game-character-concept-art-2d-game-character-sprites.jpg",
    "https://www.pngitem.com/pimgs/m/117-1170896_video-game-characters-dabbing-hd-png-download.png",
    "https://www.clipartmax.com/png/middle/91-911456_cute-video-game-characters.png",
    "https://listimg.pinclipart.com/picdir/s/423-4239525_zelda-transparent-battle-video-game-character-jumping-clipart.png"]
    photo { photo_array.sample }
  end
end
