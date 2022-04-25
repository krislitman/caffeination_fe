[![CircleCI](https://circleci.com/gh/krislitman/caffeination_fe.svg?style=shield)](https://circleci.com/gh/krislitman/caffeination_fe)
[![Heroku App Status](http://heroku-shields.herokuapp.com/caffeination-rails)](http://caffeination-rails.herokuapp.com/)

## Caffeination FE
![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/cloudy.png)

### Rails Application

**Find local coffee shops near you!**

## Table of Contents

  - [Author](#author)
  - [Getting Started](#getting-started)
  - [Views](#views)
  - [Runing the tests](#running-the-tests)
  - [Built With](#built-with)
  - [Versioning](#versions)
  - [Acknowledgements](#acknowledgements)

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/cloudy.png)
## Author

  - **Kris Litman**<br>
    [GitHub](https://github.com/krislitman)<br>
    [LinkedIn](https://www.linkedin.com/in/kris-litman/)

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/cloudy.png)
## Getting Started

### API Keys

Before getting started with installation, you will need to create an account and get API keys from
[Yelp](https://fusion.yelp.com/) and from [Abstract](https://www.abstractapi.com/) for Geolocation Services.
Please sign up to get your own copy and include them as environment variables with Figaro.
Run `figaro install` to add your own application.yml file to the application.

### Installing

These instructions will get you up and running with a copy of the project on
your local machine for development and testing purposes.

1. Fork and Clone this repo
2. Install gem packages: `bundle install`
3. Run `rails db:{drop,create,migrate,seed}` -- (you may see errors from pg_restore that you can ignore)
4. Run rails s to start the rails server
5. Go to localhost:3000 to view the Development environment for the application!

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/cloudy.png)
## Views

#### Home Page
**`localhost:3000/`**
<p>
  Welcome to Caffeination! View local coffee shops near you, register a new account to star and remember your saved shops and share your favorite coffee shops. Enter a location to search for coffee shops, or click the button for current location to find your current zipcode.
</p>

#### Registration Page
**`localhost:3000/sign_up`**
<p>
  Path to register a new user.
</p>

#### Log In Page
**`localhost:3000/log_in`**
<p>
  Path to sign in an already registered user.
</p>

#### Search Page
**`localhost:3000/search`**
<p>
  After clicking on the search button, you will be brought to the Search page where you can see the coffee shop results for the location you input. Either filter the results by "No Starbucks", "Rating", or click on the next page of results.
</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/cloudy.png)
## Running the tests

**Testing with RSpec**
To run the full test suite you will need to run the command:
`bundle exec rspec`

To run individual tests use:
`bundle exec rspec spec/folder/file`

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/cloudy.png)
## Built With

- Rails
- PostgreSQL
- RSpec
- Capybara
- Launchy
- Factory Bot Rails
- Faker
- Fast JSON API
- HTTParty
- Shoulda Matchers
- Sidekiq
- Redis
- Bcrypt
- Better Errors
- Webmock
- VCR
- Pagy
- Docker
- CircleCI
- Heroku

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/cloudy.png)
## Versions

- Ruby 3.0.0

- Rails 6.1

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/cloudy.png)
## Acknowledgements

- [Yelp](https://www.yelp.com/developers/)

- [Abstract](https://www.abstractapi.com/)
