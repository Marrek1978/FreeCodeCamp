#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

# TEST=$($PSQL "SELECT type FROM types WHERE type_id=1")
# echo $TEST

if [[ -z $1 ]]
then
  echo -e "Please provide an element as an argument."
else
  # echo argument is $1
  ELEMENT_ID=$1
  # echo $ELEMENT_ID

   # check if arg is num or string
  if [[ $ELEMENT_ID =~ ^[0-9]+$ ]]
  then 
    FOUND_ELEMENT_ID=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$ELEMENT_ID")
  else
    #search DB for element string
    FOUND_ELEMENT_ID=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$ELEMENT_ID' OR name='$ELEMENT_ID'")
  fi

  # check is null
  if [[ -z $FOUND_ELEMENT_ID ]]
  then
    echo I could not find that element in the database.
  else
    #get other data
    ELEMENT_PROPERTIES=$($PSQL "SELECT elements.atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, symbol, name FROM properties INNER JOIN elements ON properties.atomic_number=elements.atomic_number INNER JOIN types ON properties.type_id=types.type_id WHERE elements.atomic_number=$FOUND_ELEMENT_ID" )
    if [[ -z $ELEMENT_PROPERTIES ]]
    then 
      echo I could not find that element in the database.
    else
  
      echo "$ELEMENT_PROPERTIES" | while read ATM_NUM BAR TYPE BAR ATM_MASS BAR MELT_PT BAR BOIL_PT BAR SYM BAR NAME
      do 
        # echo element properties are $ELEMENT_PROPERTIES
        echo "The element with atomic number $ATM_NUM is $NAME ($SYM). It's a $TYPE, with a mass of $ATM_MASS amu. $NAME has a melting point of $MELT_PT celsius and a boiling point of $BOIL_PT celsius."

      done
    fi
  fi
fi



