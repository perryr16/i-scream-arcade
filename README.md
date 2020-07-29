# IScream Arcade

<img width="1433" alt="Screen Shot 2020-07-29 at 2 20 18 PM" src="https://user-images.githubusercontent.com/59414750/88849134-acacbf00-d1a6-11ea-967d-875140205ab5.png">

BE MOD3 Group Project

Click [here](https://i-scream-arcade.herokuapp.com/) to view it in production

**Team Members**

[Mariana Cid](https://github.com/Mariana-21)

[Whitney Kidd](https://github.com/whitneykidd)

[Ross Perry](https://github.com/perryr16)

[Melanie Tran](https://github.com/melatran)

## Quick Links

[About](#about)

## About

IScream Arcade is an app designed to asist users in their hunt for the next terrifying video game. The game data is returned from a sinatra microservice that accesses the IGDB (Internet Game Database) API. You can read more about the API documentation [here](https://api-docs.igdb.com/#about)

Users and visitors may take the ever terrifying `Fear Quiz` that will expose your true fears. Based on the results IScream Arcade will recommend video games that contain your recently exposed fears.

Certain functionality is hidden from the visitor accounts. To create an account, simply login with Google OAuth. Once a user is logged in, users may add games to their 'Saved Game' list, and contribute to the community by adding game reviews and "IScream" ratings.

A visitor or user may get information regarding a single game or a single keyword (terrifiny keywords recommended) by entering the search type and search term on the home page.

Games are returned with data relavent to your decision making such as trailers, descriptions, critical ratings, screenshots, themes, genres, and similar games. Similar games link to their game profile-- the rabbit hole is endless.

## Software Requirements
* Ruby Version 2.5.3
* Rails Version 5.2.4

## Getting Started
If you want to create your own IScream Arcade and make any additional improvements or add extenstions. Follow these steps.

To begin, fork and clone this repository. Or you can run the following command below if you are not interested in saving your own copy.

```
git clone git@github.com:perryr16/i-scream-arcade.git
```

Once the repository has been downloaded to your local machine. Run the following commands:

```
bundle install
rails db:create
rails db:migrate
rails db:seed
```

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

## Schema

![Untitled](https://user-images.githubusercontent.com/59414750/88850305-69535000-d1a8-11ea-92aa-e1ee45b49b4c.png)

## Visitor Functionality
Visitors have the ability to search for games on our website and take the fear quiz to see a list of recommended games that match their fears. Remember, the purpose of our application is fear.
