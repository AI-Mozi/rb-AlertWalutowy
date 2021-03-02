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
     </br>
    - Export the environment to set the credentials with
      ```
      export DATABASE_USERNAME=demo_aa DATABASE_PASSWORD=demo_aa
      ```
      </br>
### Services

### Deployment instructions
