# Groceries-on-Rails

## Description

This Rails API was created to provide scraped data from two supermarkets for use with the mobile application [shop1stop](https://github.com/esther-ng/shop1stop). There are two custom rake jobs (see lib) that run weekly to update sale data through a cron job set up using the whenever gem (see config/schedule.rb). Unfortunately, these jobs only run successfully when in a local development environment. Thus, you will find seed source data hard coded in the seed_files folder.

To request a search of each store's offerings and receive an array of search results, send requests in the following format:

https://evening-sea-83050.herokuapp.com/products/search?query=search+term&store=store_id

where store_id is 1 for QFC and 2 for Safeway.

## For production
 * db/seeds.rb - change reference to seed_files folder path accordingly
 * database.yml - create your own database.yml file
 * secrets.yml - create your own secrets.yml file if linking a postgres database

## Dependencies

For data scraping/parsing:
 * nokogiri
 * httparty

For scheduling cron jobs:
 * whenever

For testing:
 * minitest/reporters
 * vcr
 * webmock/minitest
 * simplecov

For deployment:
 * capistrano
 * passenger
