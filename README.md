# IScream Arcade

IScream Arcade is an app designed to asist users in their hunt for the next terrifying video game. The game data is returned from a sinatra microservice that accesses the IGDB (Internet Game Database) API. You can read more about the API documentation [here](https://api-docs.igdb.com/#about)

Users and visitors may take the ever terrifying `Fear Quiz` that will expose your true fears. Based on the results IScream Arcade will recommend video games that contain your recently exposed fears. 

Certain functionality is hidden from the visitor accounts. To create an account simply login with Google OAuth. Once a user is logged in users may add games to their 'Saved Game' list, and contribute to the community by adding game reviews and ratings. 

A visitor or user may get information regarding a single game or a single keyword (terrifiny keywords recommended) by entering the search type and search term on the home page. 

Games are returned with data relavent to your decision making such as trailers, descriptions, critical ratings, screenshots, themes, genres, and similar games. Similar games link to their game profile-- the rabbit hole is endless.

## Software Requirements
* Ruby Version 2.5.3
* Rails Version 5.2.4

## Getting Started
To begin, fork and clone this repository. Once opened, run `bundle install`.
To open the web application run the command `heroku open` or enter `https://i-scream-arcade.herokuapp.com/` in your internet browser


## Running the Test Suite 
The test suite is run using RSpec and Capybara. The test results have been mocked and stubbed using Webmock and VCR. To run all tests simply enter the following commands.

`rails g rspec:install`
`bundle exec rake db:create`
`bundle exec rspec`

In order to run tests with fresh data you must also clone down and start the [sinatra microservice](https://github.com/perryr16/i-scream-arcade-microservice). Once the microservice has been opened run the following commands to get it setup. 

`bundle install`
`shotgun`

Shotgun is a gem that starts the sinatra service while allowing developers to make changes that will automatically reload on the local server. Shotgun will run the server on `localhost:9393` where you can hit the API directly. Once the server is running you must change the IScream Arcade Service connection address in `/app/services/i_scream_service.rb` to `http://localhost:9393`. 

To return the test suite to its normal state, change the connection address from `http://localhost:9393` back to `https://i-scream-microservice.herokuapp.com`. To maintain VCR's functionality change all references in the VCR cassettes from `http://localhost:9393` to `https://i-scream-microservice.herokuapp.com`.


* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
