#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\nAmeluc's Hair Salon\n\nWelcome to Ameluc Salon, how can I help you?"

get_service_name_by_id() {
  local SERVICE_ID=$1
  echo $($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID" | sed 's/[[:space:]]\+/ /g' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
}

get_customer_name_by_phone() {
  local CUSTOMER_PHONE=$1
  echo $($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'" | sed 's/[[:space:]]\+/ /g' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
}

add_new_customer() {
  local CUSTOMER_NAME=$1
  local CUSTOMER_PHONE=$2
  $($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
}

get_customer_id_by_phone() {
  local CUSTOMER_PHONE=$1
  echo $($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'" | sed 's/[[:space:]]\+/ /g' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
}

main() {
  if [[ $1 ]]
  then
      echo -e "\n$1"
  fi

  NUMBER=$($PSQL "SELECT service_id FROM services" | sed 's/[[:space:]]\+/ /g' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

  for SERVICE_ID in $NUMBER
  do
      SERVICE=$(get_service_name_by_id $SERVICE_ID)
      echo "$SERVICE_ID) $SERVICE"
  done

}

main
   
read SERVICE_ID_SELECTED

if [[ $SERVICE_ID_SELECTED =~ ^-?[0-9]+$ ]] && [[ $SERVICE_ID_SELECTED -le 5 ]]
then
    SERVICE=$(get_service_name_by_id $SERVICE_ID_SELECTED)
    SERVICE_ID=$SERVICE_ID_SELECTED

    echo -e "\nCan I get your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$(get_customer_name_by_phone $CUSTOMER_PHONE)

    if [[ -z $CUSTOMER_NAME ]]
    then
        echo -e "\nHum, I don't have a record for that phone number.\nWhat's your name?"
        read CUSTOMER_NAME
        add_new_customer "$CUSTOMER_NAME" "$CUSTOMER_PHONE"
    fi

    CUSTOMER_ID=$(get_customer_id_by_phone $CUSTOMER_PHONE)

    echo -e "\nWhat time would you like your $SERVICE, $CUSTOMER_NAME?"
    read SERVICE_TIME

    $($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $CUSTOMER_ID, $SERVICE_ID)")
    
    main "I have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME.\n"
else
    main "Seems like that service is yet to be featured.\nHere's what we offer:"
fi
