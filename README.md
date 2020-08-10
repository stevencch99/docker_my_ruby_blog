# The cont Branch: practice to connect 2 container
- Rails app
  - config/database.yml => `host: <=% ENB['DATBASE_HOST'] =>`
  - pass environment variable DATABASE_HOST with the dns name of database
  - `$ docker run -it --link my_db my_ruby_blog bash`
- Postgres db `$ docker run --name my_db -e POSTGRES_PASSWORD=mypassword -d postgres`

# My Ruby Blog

This is a practice project following Udemy courses 'Learn Ruby on Rails from Scratch' by instructor 'Eduonix Learning Solutions' using programming language Ruby and it's framework Rails. And using this project for OSP Taipei's Docker Study Group practice.

* Ruby version
Referenced to Gemfile for all dependencies.
* System dependencies

* Configuration

* Database creation
Use command
```
rails db:create
```
to create database.
* Database initialization
Use command
```
rails db:migrate
```
to migrate database schema.
* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
