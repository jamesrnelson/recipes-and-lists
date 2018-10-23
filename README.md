# README

Appetite is available in production at:

https://damp-escarpment-50077.herokuapp.com/


Appetite is a Rails app that allows users to search for and collect recipes by accessing the Spoonacular recipe search API. Users are also able to add their own recipes to the collection. Registered users are able to favorite recipes from the main recipe collection and from search results. Once a searched recipe is favorited it becomes available in the main collection.  Users are able to quickly search for recipes that are interesting to them and create grocery lists from their favorite recipes.

#### Ruby version

Appetite was built using Ruby 2.4.3 and Rails 5.1.6 and tested with RSpec.

#### Set up and Use

* In order to run Appetite locally, you will first need to set clone the project, bundle the project and set up the database.

```shell
git clone git@github.com:jamesrnelson/recipes-and-lists.git
```

```shell
bundle install && bundle update
```

#### Create, Migrate, and Seed the Databases
```shell
rake db:create
rake db:migrate
rake db:seed
```

* In your local backend directory, run the server on http://localhost:3000 by running the following command:

```shell
rails server
```
* Appetite was also built using Redis and Sidekiq to asynchronously send welcome emails when people create accounts. If you want to simulate this functionality on your local machine, you will need to run Redis and Sidekiq from the appetite directory in separate terminal windows. Open one terminal and start the redis server with the command `$redis-server` and open another window and run sidekiq with the command `$bundle exec sidekiq`. If you do not already have Redis server you can get it via homebrew by running `$brew install redis`

* In  your browser, navigate to http://localhost:3000. If everything has installed correctly you should be able to interact with the app as it functions in production.

#### How to run the test suite

Appetite was thoroughly tested using RSpec. In order to run the tests, make sure that you have already followed the steps about creating and migrating your database, then from your backend root directory run the following test command:

```shell
rspec
```

#### Ruby version

Appetite uses ruby version 2.4.3 and rails version 5.1.6.

#### Services

Appetite uses sidekiq and redistogo in order to offload the burden of sending welcome emails from the main rails server to the redis queue.
