# README

## Apps info
 * Rails app runs in port 3000 (using this default config)

## Docker Installation

1. Install dependencies
```
https://www.docker.com/products/docker-desktop
```

2. Clone repository
3. cd into repository folder

4. Create env files for rails
```
cp .env.example .env
```

5. Run
```
docker-compose up
```

6. Add seeds
```
docker exec -it $( docker ps | grep okrs_api | awk "{print \$1}" | head -n 1 ) rails db:seed
```

7. Rails debug
```
docker exec -it $( docker ps | grep okrs_api | awk "{print \$1}" | head -n 1 ) rails c
```


## Installation

1. `bundle install`
2. `bundle exec sidekiq`
3. Open other terminal and run:
4. `rails db:create`
5. `rails db:migrate`
6. `rails db:seed`
7. `rails s`

## Authentication

Based on JWT. To generate a token for testing you can generate it via console or use authentication endpoint

### Generating token with consle

1. Go to the rails console `rails c`
2. `JsonWebToken.encode(user_id: User.first.id)`
3. Add the following headers to your request:

Authorization  <token>
Content-Type  application/json

### Using the Authentication endpoint

Send the username and password of an existing user. Below you can find the example for one of the seed users

```
curl -d '{"username":"cruella", "password":"letmein1"}'  -H "Content-Type: application/json" -X POST http://localhost:3000/authenticate | jq --raw-output '.auth_token'
```

## Endpoints

To test the examples with curl:

Before run:
```
brew install jq
```

then save the token:

token=$(curl -d '{"username":"cruella", "password":"letmein1"}'  -H "Content-Type: application/json" -X POST http://localhost:3000/authenticate | jq --raw-output '.auth_token')

and send the following requests:

### POST /goals

```
curl --location --request POST 'http://localhost:3000/goals' \
--header "Authorization: $token" \
--header 'Content-Type: application/json' \
--data-raw '{
    "goal": {
        "title": "Test"
    }
}'
```

### POST /goals/:id/key_results

```
curl --location --request POST 'http://localhost:3000/goals/1/key_results' \
--header 'Content-Type: application/json' \
--header "Authorization: $token" \
--data-raw '{
    "key_result": {
        "title": "Test"
    }
}'
```

### GET /goals

Has pagination via the `page` query param

```
curl --location --request GET 'http://localhost:3000/goals?page=1' \
--header "Authorization: $token" \
--header 'Content-Type: application/json'
```

## Implementation notes

Decided to implement the calculation of the goal progress async to help with:

1. Reading requests and avoid N+1 queries in the `/goals` endpoint
2. Have a non-blocking operation for calculations

This project provides basic Authentication with JWT. The token is set to expire in 24 hours by default.
