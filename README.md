# README

## Shopify Backend Developer Intern Challenge - Summer 2022

### About

TASK: Build an inventory tracking web application for a logistics company. We are looking for a web application that meets the requirements listed below, along with one additional feature (filtering based on tags).

See it deployed, [here](https://mysterious-savannah-03677.herokuapp.com/)

#

## How to use the app

On the homepage, you will see a list of all products. Each item has an "edit" link to edit the item details, and a "delete" link to delete the item. Click on the item name to view a specific item. You filter the inventory items by tag. At the top of the homepage, use the dropdown to chose a tag to filter by and click the "filter" button. Click "Clear filter" to remove the filter and see all inventory items again. At the bottom of homepage, there is an "Add New Product" link which renders a form to create a new product.

#

## Built with:

### Ruby version

3.0.0

### Rails version

6.1.4.4

#

## Getting started

### Running natively

Note: If you don't have ruby/rails installed, check out this article for [instructions](https://medium.com/@herowebdev1/install-rails-on-your-mac-linux-via-homebrew-a36e57867bae)

1.) Clone the repo <br> <br>
2.) Make sure your ruby enironment is at least 3.0.0

```
ruby --version
```

3.) bundle install <br>
in rails folder:

```
gem install bundle
bundle install
```

4.) Create and migrate databases <br>
in rails folder:

```
bundle exec rails db:create && bundle exec rails db:migrate
```

5.) Seed the database with some starter data

```
rails db:seed
```

6.) Start the development server <br>
in rails folder:

```
rails s
```

7.) naviagte to localhost:3000

#

## How to run the test suite

In the console, navigate to the project folder run

```
rspec
```
