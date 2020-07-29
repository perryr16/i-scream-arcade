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

![giphy](https://user-images.githubusercontent.com/59414750/88854080-05cc2100-d1ae-11ea-8168-a708186ce93b.gif)

* [About](#about)
* [Software Requirements](#software-requirements)
* [Getting Started](#getting-started)
* [Test Suite](#running-the-test-suite)
* [Schema](#schema)
* [Fear Quiz](#fear-quiz)
* [Games](#games)
* [Reviews](#reviews)
* [Profile](#profile)
* [User Experience](#user-experience)

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

## Fear Quiz

<img width="1427" alt="Screen Shot 2020-07-29 at 3 21 23 PM" src="https://user-images.githubusercontent.com/59414750/88854860-35c7f400-d1af-11ea-9317-3b41ed333c84.png">

## Games

<img width="1433" alt="Screen Shot 2020-07-29 at 2 53 42 PM" src="https://user-images.githubusercontent.com/59414750/88852381-7160bf00-d1ab-11ea-8c76-89ffec36ff06.png">

<img width="1427" alt="Screen Shot 2020-07-29 at 3 02 14 PM" src="https://user-images.githubusercontent.com/59414750/88854292-4b88e980-d1ae-11ea-9f13-e3e0909909bb.png">

## Reviews

<img width="1427" alt="Screen Shot 2020-07-29 at 3 03 00 PM" src="https://user-images.githubusercontent.com/59414750/88854367-68bdb800-d1ae-11ea-938e-67f91c2fae54.png">

<img width="1427" alt="Screen Shot 2020-07-29 at 3 02 45 PM" src="https://user-images.githubusercontent.com/59414750/88854666-dd90f200-d1ae-11ea-883b-85b9c928f1be.png">

## Profile

<img width="1234" alt="Screen Shot 2020-07-29 at 3 01 45 PM" src="https://user-images.githubusercontent.com/59414750/88854485-9276df00-d1ae-11ea-8c34-582cd5fd59d5.png">

<img width="1427" alt="Screen Shot 2020-07-29 at 3 03 19 PM" src="https://user-images.githubusercontent.com/59414750/88854519-a0c4fb00-d1ae-11ea-8198-a52f750ee167.png">

## User Experience

There are two main types of users on our application (a regular user or a visitor). Visitors such as the casual gamer or a parent can search games and select some fears to return recommended games. For example, if a mom does not want her child to play games that involve drowning, they can select `drowning` from the quiz. It returns a list of games that include the keyword drowning and as a parent, those would be the games I would have my child avoid.

As a logged in user, you get to experience all the benefits listed above. Once a user has authorized Google, they have the ability to rate, review, and save games.

## Future Implementations

* Build a "cute search" for users that return games that don't include their fears
* Provide a user with a button that allows them to buy the game
