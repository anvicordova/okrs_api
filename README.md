# README

## Installation

1. `bundle install`
2. `bundle exec sidekiq`
3. Open other terminal and run:
4. `rails db:create`
5. `rails db:migrate`
6. `rails db:seed`
7. `rails s`

## Authentication

Based on JWT. To generate a token for testing you can do the following

1. Go to the rails console `rails c`
2. `JsonWebToken.encode(user_id: User.first.id)`
3. Add the following headers to your request:

Authorization  <token>
Content-Type  application/json

## Endpoints

POST /goals

```
curl --location --request POST 'http://localhost:3000/goals' \
--header 'Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2NDM3NTk0Mjh9.YZ79RMFWwD7-u3V287uSQmC0KnBvowoPilNBntYZVZY' \
--header 'Content-Type: application/json' \
--data-raw '{
    "goal": {
        "title": "Test"
    }
}'
```

POST /goals/:id/key_results

```
curl --location --request POST 'http://localhost:3000/goals/1/key_results' \
--header 'Content-Type: application/json' \
--header 'Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2NDM3NTk0Mjh9.YZ79RMFWwD7-u3V287uSQmC0KnBvowoPilNBntYZVZY' \
--data-raw '{
    "key_result": {
        "title": "Test"
    }
}'
```

GET /goals

```
curl --location --request GET 'http://localhost:3000/goals?page=1' \
--header 'Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2NDM3NTk0Mjh9.YZ79RMFWwD7-u3V287uSQmC0KnBvowoPilNBntYZVZY' \
--header 'Content-Type: application/json'
```