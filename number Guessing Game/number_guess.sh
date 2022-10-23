#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess -t -A --tuples-only -c"
# TEST=$($PSQL "SELECT * FROM users" ) 
# echo $TEST

echo -e "\n~~~~~ Number Guessing Game ~~~~~\n\n"

ENTER_NAME() {

  if [[ $1 ]]
  then
    echo $1
  fi

  echo "Enter your username:"
  read ENTERED_NAME

  READ_NAME "$ENTERED_NAME"

}

READ_NAME() {
  # echo $1

  #in DB?
  if [[ -z $ENTERED_NAME ]]
  then
    ENTER_NAME "Please enter your Username"
  else
    # search DB for username
    IS_USERNAME=$($PSQL "SELECT * FROM users WHERE username='$ENTERED_NAME' " )  

    #no username found
    if [[ -z $IS_USERNAME ]]
    then
      echo "Welcome, $ENTERED_NAME! It looks like this is your first time here."
      # enter into db
      INSERT_NEW_USERNAME=$($PSQL "INSERT INTO users(username) VALUES('$ENTERED_NAME')" )
      
      #DB check
      if [[ -z $INSERT_NEW_USERNAME ]]
      then
        echo 'There was a problem with the database'
      fi

    #username was found
    else
      USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$ENTERED_NAME' " )
      MAX_GAME_NUMBER=$($PSQL "SELECT COUNT(game_number) FROM games WHERE user_id='$USER_ID' " ) 
      BEST_SCORE=$($PSQL "SELECT MIN(num_guesses) FROM games WHERE user_id='$USER_ID' " ) 
      
      echo "Welcome back, $ENTERED_NAME! You have played $MAX_GAME_NUMBER games, and your best game took $BEST_SCORE guesses."
    fi
  fi
  
  GUESS_NUMBER "$ENTERED_NAME"

}

GUESS_NUMBER() {

  # only on first call
  if [[ -z $RANDOM_NUMBER ]]
  then 
    (( RANDOM_NUMBER=13 ))
    (( NUM_GUESSES=0 ))
    USERNAME=$1

    echo "Guess the secret number between 1 and 1000:"
  fi

  read GUESSED_NUMBER

  # check is integer
  if [[ !  $GUESSED_NUMBER =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    GUESS_NUMBER "$1"
  else
    (( NUM_GUESSES+=1 ))

    #equality checks
    if [[ $GUESSED_NUMBER -gt $RANDOM_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
      GUESS_NUMBER "$1"
    elif [[ $GUESSED_NUMBER -lt $RANDOM_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
      GUESS_NUMBER "$1"
    elif [[ $GUESSED_NUMBER -eq $RANDOM_NUMBER ]]
    then
      echo "You guessed it in $NUM_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"

      USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME' " )
      MAX_GAME_NUMBER=$($PSQL "SELECT COUNT(game_number) FROM games WHERE user_id='$USER_ID' " ) 

      #if no data returned = frist timer
      if [[ -z $MAX_GAME_NUMBER ]]
      then
        (( MAX_GAME_NUMBER=1 ))
      else
        (( MAX_GAME_NUMBER+=1 ))
      fi

      INSERT_GAME_DATA=$($PSQL "INSERT INTO games (user_id, game_number, num_guesses) VALUES ($USER_ID, $MAX_GAME_NUMBER, $NUM_GUESSES ) " )   
    
    else
      echo "There was a problem with the number"
    fi
  fi
}

ENTER_NAME