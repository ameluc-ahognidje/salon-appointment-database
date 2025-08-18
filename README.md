# Salon Appointment Database

A CLI app for fictional hair salon that works with a database to handle services, customers and appointments.

## Stack
- PostgreSQL
- Shell

## Functionalities
- List the available services,
- Ask the user to pick a service,
- Ask the user's phone number:
  - if they're new add them to the database,
  - if not get the customer info and proceed to the following step
- Schedule an appointment after asking for a desired time 

## Installation
1. Open a terminal and clone this repo with the command: `git clone https://github.com/ameluc-ahognidje/salon-appointment-database.git`,
2. Then use this command to go in the cloned folder: `cd salon-appointment-database`,
3. Open another terminal process or tab to connect to your database, if you don't know how to do, visit [this page](https://www.postgresql.org/docs/),
4. Make the script executable with the command `chmod +x ./salon.sh`,
5. You can now run the app (script) with `./salon.sh`

## About
I made this project as part of my [freeCodeCamp](https://www.freecodecamp.org/certification/ameluc/relational-database-v8) curriculum and thanks to it I learned:
- how shell scripting,
- how to work with a database of type SQL,
- how to communicate with such database from the terminal

## Licence
This project is under the MIT Licence - see [LICENSE](LICENSE)
