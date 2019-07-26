# README

/////* environment */////

* Ruby version 2.6.3
* Rails 5.2.3
* Postgres 11.4
* Redis 5.0.5

/////* how to development */////

after git clone...

-1.move project file.

-2.return this command.

sudo bundle install

-3.create database [rails];

※ when you got like this error, it's solution.

sudo vim /etc/hosts
#before
127.0.0.1       localhost
↓
#after
127.0.0.1       localhost db
