# JSON POST Service APP

A JSON API service developed in Sinatra, Ruby.

## Technologies
* Ruby 2.7.1

## Development
### 1. Initial Setup
--------------------

Clone the project repo

    $ git clone https://github.com/abr3222/post_task

Get into the project directory

    $ cd post_task
Install gems and their dependencies

    $ bundle install

### 2. Setting up Evn or Database.yml file
-------------------------------
Copy the environment variables example file

Use following command to do so

    $ cp example.env .env
    $ cp example.database.yml database.yml


* Set the following ENV Variables in `.env` file
    DB_NAME, DB_USER, DB_PASSWORD, DB_HOST

### 3. Database Setup
--------------------
For setting up the Database(s).

    $ rake db:create 
    $ rake db:migrate

### 4. Start the Server
--------------------
For Start the Puma Server.

    $ ruby app.rb

### 5. Run the Seeding to Dump Data
--------------------
* keep Start the Puma Server. 
* run the following command to dump the data.


    $ rake db:seed

### 6. Cron Jobs
---------------------
Setting up the cron jobs

    $ whenever --update-crontab

### 7. For Create a Report without cron job
-------------------------------
Start the Application server

    $ rake generate_report 

