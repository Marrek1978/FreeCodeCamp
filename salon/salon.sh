#!/bin/bash


# PSQL="psql --username=freecodecamp --dbname=salon -c"
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

$($PSQL "DELETE FROM appointments ")
$($PSQL "DELETE FROM customers ")

echo -e "\n~~~~~ MY SALON ~~~~~\n "
echo -e "\nWelcome to My Salon, how can I help you?"

MAIN_MENU() {

  if [[ $1 ]]
  then
    echo -e "\n$1,  how can I help you?"
  fi

  LIST_OF_SERVICES=$($PSQL "SELECT * FROM services" )
  if [[ -z $LIST_OF_SERVICES ]]
  then
    echo "Sorry, no services are available right now"
  else
    echo "$LIST_OF_SERVICES" | while read ID BAR SERVICE
    do
      echo "$ID) $SERVICE"
    done

    read SERVICE_ID_SELECTED    
    BOOK_SERVICE "$SERVICE_ID_SELECTED"

  fi

}

BOOK_SERVICE(){
  if [[ !  $1 =~ ^[0-9]+$ ]]
  then
    MAIN_MENU  "That is not a valid service number"
  else
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id='$1' ") 
    if [[ -z $SERVICE_NAME ]]
    then
      MAIN_MENU "Please choose a service"
    else
      echo You selected $SERVICE_NAME
      echo -e "\nWhat is your phone number"
      read CUSTOMER_PHONE
      # is user in customer table?
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE' " ) 
  
      if [[ -z $CUSTOMER_NAME ]]
      then 
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        ENTER_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE') ")
      fi

      echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME"
      read SERVICE_TIME
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE' " ) 

    fi
     
    ENTER_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $1, '$SERVICE_TIME' ) " )

    if [[ -z $ENTER_APPOINTMENT ]]
    then 
      MAIN_MENU "There was a problem booking the appointment"
    else
      echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
    fi
  fi
}

MAIN_MENU
