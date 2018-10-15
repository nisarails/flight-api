## flight-api

This project was created with Ruby on Rails.
* Used data scraping all flight departures and arrival from Copenhagen Airport's website: https://www.cph.dk/en.
* Created ruby on rails API for getting fight information.

## Technical Dependency

* Used `anemone` gem for scrapping along with `pg` gem for database.

## Installation

* First take a clone of this repo.

  `git clone https://github.com/nisarails/flight-api.git`

* Installed all dependency.

  `bundle install`

* Create database.

  `rails db:create`

* Migrate database.

  `rails db:migrate`

* Import data through scraping.

  `rails import_flight_info:departures` and `rails import_flight_info:arrivals`

* Start server.

  `rails s`
