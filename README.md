# Alert Walutowy

A simple application that allows you to check the values of currencies. </br>
You can choose those that interest you, view their charts and get messages where valuta reaches the selected value.</br>
https://pacific-castle-09551.herokuapp.com/


### Ruby version
  * 2.7.1
### System dependencies
  * PostgresSQL
### Installation
  * Clone project using Git </br>
  * Run `bundle install` </br>
  * Configure database </br>
    - Create the DB user by running command: </br>
      ```
      sudo -u postgres psql -c "CREATE USER username WITH CREATEDB NOCREATEROLE PASSWORD 'password'"
      ```
    
    - Add password adn username to .env file <br>
      ```
       AW_DB_PASSWORD=password
       AW_DB_USERNAME=username
      ```
  * Run command `bin/rails db:setup` to create database with seed data. 
  * Start server: `bin/rails s`
  * Navigate in browser to: http://localhost:3000/

### Services 

### Deployment instructions
