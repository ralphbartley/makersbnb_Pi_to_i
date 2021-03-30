# Welcome to the Pi.to_i Makers Bnb!

1. ``` $ bundle install ```
2. Install PostgreSQL (instructions for linux vary, this is for mac)
  ```
  brew install postgresql
  ```
 - if installing PostgreSQL for the first time then you'll need to follow the directions to set your user up when psql prompts you to.
 - enter interactive terminal
 ```
 $ psql postgres ## postgres is automatically provided as a database to connect to
 # \i ./db/migrations/production.sql
 # \i ./db/migrations/test.sql
 # \l ## list databases so you can see that a production and test server have been created
 ```



## Headline specifications

- Any signed-up user can list a new space.
- Users can list multiple spaces.
- Users should be able to name their space, provide a short description of the space, and a price per night.
- Users should be able to offer a range of dates where their space is available.
- Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
- Nights for which a space has already been booked should not be available for users to book that space.
- Until a user has confirmed a booking request, that space can still be booked for that night.


### User Stories:

```
STRAIGHT UP

As a user
So that I can have an account
I would like to able to sign up

As a user
So that I can rent my space
I would like to be able to list a new space

As a user
So that I can rent multiple space
I would like to be able to list more than one new space

As a user
So that I can give details of my space
I would like to be able to provide a name, short description, and a price per night

As a user
So that I can let users know when my space is available
I would like to be able to show a range of dates where their space is available

As a user
So that I can hire any space for one night
I would like to be able to request the night from the space owner

As a user
So that I am in charge of bookings
I would like to be able to approve booking requests

As a user
So that I avoid double bookings
I would like to remove approved booked dates

As a user
So that I don't miss out on any bookings
I would like to receive requests until booking dates are approved

```

![Chitter Domain Model (1)](https://user-images.githubusercontent.com/74908625/112954819-ace6cb00-9136-11eb-8e11-3a545e7a9d5e.jpg)
