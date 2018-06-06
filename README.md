# README

Appetite is available in production at:

https://damp-escarpment-50077.herokuapp.com/

## Version 1.0

Appetite is a rails app that allows users to search for and collect recipes by accessing the Spoonacular recipe search API. Users are also able to add their own recipes to the collection. Registered users are able to favorite recipes from the main recipe collection and from search results. Once a searched recipe is favorited it becomes available in the main collection. All of these recipes are able to be added to the users basket, which can be converted into a grocery list.

Users will be able to quickly search for recipes that are interesting to them and create grocery lists from their favorite recipes.

## Coming Soon - Version 1.1

Version 1.1 will contain the same base functionality as version 1.0, with the additional ability to auto-populate your grocery list at Amazon Fresh so that you can place your order and receive a same-day delivery.

#### Ruby version

Appetite uses ruby version 2.4.3 and rails version 5.1.6.

#### Setup

In order to get Appetite running locally, you will need to clone the repo, run 'bundle' (and 'bundle update' on a case-by-case basis) and then rake db:setup.

#### Testing

The test suite is written using rspec. From the root directory, run 'rspec' from the command line

#### Services

Appetite uses sidekiq and redistogo in order to offload the burden of sending welcome emails from the main rails server to the redis queue.
