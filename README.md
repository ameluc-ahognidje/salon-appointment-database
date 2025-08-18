# Salon Appointment Database

A CLI app for fictional hair salon that works with a database to handle services, customers and appointments.

## Stack
- PostgreSQL,
- Shell

## Prerequisites
You need to have [PostgreSQL](https://www.postgresql.org) installed on your device.

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
3. Open another terminal process or tab:
   - Import the database dump with `psql -U postgres -d salon -f path-to-file/salon.sql`,
   - Connect/launch the postgre/the database
5. Make the script executable with the command `chmod +x ./salon.sh`,
6. You can now run the app (script) with `./salon.sh` and follow the intructions.

## About
I made this project as part of my [freeCodeCamp](https://www.freecodecamp.org/certification/ameluc/relational-database-v8) curriculum and thanks to it I learned:
- how shell scripting,
- how to work with a database of type SQL,
- how to communicate with such database from the terminal

## Updates
I have to make the script more flexible for example by asking for user credential and such because for now it is tied to the user I made it with.

## Licence
This project is under the MIT Licence - see [LICENSE](LICENSE)
