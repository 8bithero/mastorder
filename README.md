# MASTORDER

## Task
An organisation needs an API to share order information. Your task is to implement two simple API endpoints using Ruby on Rails to share that data as JSON.

Each order should contain:
* A date.
* A total amount in GBP£.
* A list of the products and the quantities of each product that were ordered.

Each product should contain:
* A UUID.
* A name.
* A description.
* A price in GBP£.

The API endpoints to implement are:
```
  GET /v1/orders            -> Return all orders and dependent products
  GET /v1/orders/:order_id  -> Return a specific order by ID and dependent products
```

Your solution should include the necessary DB migrations, models, controllers, etc.

## Install app
```
  $ bundle install
  $ rails db:migrate db:seed
```

## Paths
```
  api.localhost:3000/v1/orders
  api.localhost:3000/v1/orders/:id
```

_Gotcha_
The app makes use of subdomain.
Note the `api.` before `localhost`
