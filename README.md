# Property Search

A simple Rails application which can search and list similar properties.

## Features

### Search
It is possible to search by name and number of bedrooms (bedroom_count). When searching by bedrooms the results are ordered by bedrooms.

### Similar Properties
The definition of similar properties is within 20km and greater or equal amount
of bedrooms. When searching by similar properties the results are ordered by
distance.

## Setup
Once you have a copy of the repository, run bundle install

    bundle install

Migrate and seed the database

    rake db:migrate
    rake db:seed

Then start with foreman

    foreman start