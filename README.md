#About task:

You will be given dump of PostgreSQL(9.6) database. We don't want you to lose too much time so ~3 hours should be enough, if you don't finish the task in 3 hours don't continue to work on it and just publish what you have.

Restoring database:
```pg_restore --verbose --clean --no-acl --no-owner -h localhost -U yourpostgresuser -d store_development store.pgdb```

Link to database: `https://drive.google.com/...` 

###Task:
###Create web application for given DB.
###Normalize DB.
###Implement next REST methods:
`/books` – return all books
`/books/prime` – lreturn ist of books where name size is prime number
`/articles` – return all articles
`/search/filter` – find books and articles by specific parameters
####Parameters:
`Name` – book or article name
`Genre` – genre name
`Author` – author name
`Publisher` – publisher name
`/lists/books` – return list of available top 5 books for discount lists



[![Build Status](https://travis-ci.org/DmytroStepaniuk/bookshop.svg?branch=master)](https://travis-ci.org/DmytroStepaniuk/bookshop)
[![CodeClimate](https://codeclimate.com/github/DmytroStepaniuk/bookshop.svg?branch=master)](https://codeclimate.com/github/DmytroStepaniuk/bookshop)
[![Coverage](https://codeclimate.com/github/DmytroStepaniuk/bookshop/badges/coverage.svg?branch=master)](https://codeclimate.com/github/DmytroStepaniuk/bookshop)
[![Dependency Status](https://gemnasium.com/badges/github.com/DmytroStepaniuk/bookshop.svg)](https://gemnasium.com/github.com/DmytroStepaniuk/bookshop)

# Bookshop test task

## Clone project
```
git clone https://github.com/Roxana1989/bookshop.git
```
## Install gems
```
bundle install
```
## Create database

add to file database.yml

```
username: "Your username"
password: "some password"
```

```
rake db:create
```
## Run migrations

```
rake db:migrate
```
