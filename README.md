# Sales Dashboards

A wallboard display for sales data that shows special celebration screen when a new deal is won.

## Getting started

You may use docker to develop the project as the stack is defined in `docker-compose.yml`, the process for setup is very similar to [Running in production](#production).

If you would not like to use docker, the stack is assuming a postgres server (for the database) and a redis server (for pubsub). You can configure these the same way you would for any standard rails app.

## [Running in production](#production)

Install docker on your production machine, then run `docker-compose up`. This will use `docker-compose.yml` to create the production database, redis server, and front end.

The app will then be running on `http://localhost:3000`.