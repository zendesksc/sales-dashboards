# Sales Dashboards

A wallboard display for sales data that shows a special celebration screen when a new deal is won.

## Getting started

This app is built on Docker to make it simple to get started. However, if you'd rather not use docker, you will need to have postgres, redis and rails installed. You will need to modify some files within the app to suit your environment. 

## Running in Development

To run the app for development you will need two shells. In the first, run the following command which will setup rails, postgres, and redis.

```
$ docker-compose up
```

Then in your other shell, run the following command to setup the database for development.

```
$ docker-compose exec web rails db:setup
```

Anytime you need to run commands on the container, you will need to prefix it with `$ docker-compose exec web`. For example to create a model, the command would be `$ docker-compose exec web rails generate model ModelName title:string`.

The app will be running on `http://localhost:3000`.

## Running in production

Install docker on your production machine, then, inside the app directory, run:

```
$ SECRET_KEY_BASE=mysecretkey docker-compose -f production.yml up -d
``` 

This will use `production.yml` to create the production database, redis server, and front end. 
Before you are able to see the app running, you'll need to setup the database, and precompile your assets.

```
$ docker-compose exec web rails db:setup
$ docker-compose exec web rails assets:precompile RAILS_ENV=production
$ docker-compose restart
```

The app will then be running on `http://localhost:3000`.

### Pulling updates

If you need to `git pull` changes to the code, you will need to run 

```
$ docker-compose build --no-cache web
```

### Reverse proxy with NGINX

In order to get this app working with NGINX as a reverse proxy, you will need to add the following to your location block. This allows the proxy to make requests other than `GET`, and also sets up the websocket connection for redis.

```
location / {
    proxy_pass http://127.0.0.1:3000;
    proxy_set_header Host $host;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
}

```