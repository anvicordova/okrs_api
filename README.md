# README

## Installation

1. `bundle install`
2. `bundle exec sidekiq`
3. `rails s` (In other terminal)

## Endpoints

POST /goals
POST /goals/:id/key_results
GET /goals

## Authentication

Based on JWT. To generate a token for testing you can do the following

1. Go to the rails console `rails c`
2. `JsonWebToken.encode(user_id: User.first.id)`
3. Add the following headers to your request:

Authorization  <token>
Content-Type  application/json