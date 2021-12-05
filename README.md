[![CircleCI](https://circleci.com/gh/krislitman/caffeination_fe.svg?style=shield)](https://circleci.com/gh/krislitman/caffeination_fe)

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

Before getting started with installation, you will need to create an account and get an API key from
[Yelp](https://fusion.yelp.com/)
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

#### Welcome Page
**`localhost:3000/welcome`**
<p>
  Welcome to Caffeination! View local coffee shops near you, register a new account to star and remember your saved shops and share your favorite coffee shops!
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
- Postman
- RSpec
- Capybara
- Launchy
- Factory Bot Rails
- Faker
- Fast JSON API
- HTTParty
- Shoulda Matchers
- Redis
- Bcrypt
- Better Errors
- Webmock
- VCR
- Pagy

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/cloudy.png)
## Versions

- Ruby 3.0.0

- Rails 6.1

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/cloudy.png)
## Acknowledgements

- [Yelp](https://www.yelp.com/developers/)
