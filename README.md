# Property Search

A simple Rails application which can search and list similar properties.

Live on [Heroku](http://heidar-property-search.herokuapp.com/)

Tested on Ubuntu 12.04 in Chromium.

## Features

### Search
It is possible to search by name and number of bedrooms (bedroom_count). When 
earching by bedrooms the results are ordered by bedrooms.

### Similar Properties
The definition of similar properties is within 20km and greater or equal amount
of bedrooms. When searching by similar properties the results are ordered by
distance.

### REST API

#### GET /property.json (index)
Returns a JSON encoded list of properties. Supported query parameters are name,
bedroom_count and similar. Get all properties with 'flat' in their name:

    GET /property.json?name=flat
    
Get all properties with 2 or more bedrooms and order by bedrooms.

    GET /property.json?bedroom_count=2
    
Get all properties that are similar to property with id 1. Similar is defined above.

    GET /property.json?similar=1
    
#### GET /property/1.json (show)
Returns a single JSON encoded property with the given ID.

## Setup
Once you have a copy of the repository, run bundle install

    bundle install

Migrate and seed the database

    rake db:migrate
    rake db:seed

Then start with foreman

    foreman start

## Tests
Prepare the test database

    rake db:test:prepare

Run rspec

    rspec spec
