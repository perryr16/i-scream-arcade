# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ghost_array = ["https://images.vexels.com/media/users/3/181081/isolated/lists/bfff9424a64534109584cbf673d77409-brain-ghost-stroke.png",
              "https://img.icons8.com/cotton/2x/ghost.png",
              "https://www.pngfind.com/pngs/m/285-2853935_transparent-background-ghost-gif-hd-png-download.png",
              "https://www.clipartmax.com/png/middle/45-459178_drawn-ghost-clipart-transparent-background-ghost-no-background.png",
              "https://i.pinimg.com/originals/46/4b/26/464b2632d12afc02c9a3447c30ded298.jpg"]

spooky_array = [
  "https://www.vhv.rs/dpng/d/136-1366570_spooky-tree-clip-art-transparent-cartoons-spooky-tree.png",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTHtlcwAA8dbD_v316N4nD6vv167IyPfq8BEw&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTnqTyM9hT8JvbyteSFFexyFUroTHZCih8HVw&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRKdoe0H-tzGxvtlQqINfzvte7R1Kf2E4df-w&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTVfiblxurbZmMchkPfRiWlekK1oHZ_SALgkw&usqp=CAU",
  "https://banner2.cleanpng.com/20180713/xr/kisspng-smiley-ghost-spirit-halloween-clip-art-bad-spirits-5b4924360558c5.9826495615315200540219.jpg"
] 
Game.destroy_all
30.times do 
    Game.create!(
      title: Faker::Games::SuperSmashBros.fighter,
      agg_rating: rand(1..100),
      cover: spooky_array.sample,
      popularity: rand(1..100),
      video: "http://Video_URL.com"
    )
end
