#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess -t --no-align -c"

SRANDOM=$((1 + RANDOM % 1000))

echo "Enter your username:"
read NAME

CHECK_GAME_ID=$($PSQL "SELECT MAX(game_id) FROM number_guess WHERE username='$NAME';")

if [[ -z $CHECK_GAME_ID ]]; 
then 
  echo "Welcome, $NAME! It looks like this is your first time here."
  echo "Guess the secret number between 1 and 1000:"
else 
  games_played=$($PSQL "SELECT SUM(game_played) FROM number_guess WHERE username='$NAME';")
  best_game=$($PSQL "SELECT MIN(guest_count) FROM number_guess WHERE username='$NAME' AND guest_count>0;")

  echo "Welcome back, $NAME! You have played $games_played games, and your best game took $best_game guesses."
  echo "Guess the secret number between 1 and 1000:"
fi



GUESS_COUNTER=0

while true; do
    
    read Guess

    if [[ $Guess =~ ^[0-9]+$ ]]; 
    then
    ((GUESS_COUNTER++))

        if [[ $Guess -eq $SRANDOM ]]; 
        then
        INSERT_NAME=$($PSQL "INSERT INTO number_guess(username, secret_number) VALUES ('$NAME', '$SRANDOM');")
        CHECK_GAME_ID_2=$($PSQL "SELECT DISTINCT MAX(game_id) FROM number_guess WHERE username='$NAME';")
        LAST_COUNT=$($PSQL "UPDATE number_guess SET guest_count=$GUESS_COUNTER WHERE game_id=$CHECK_GAME_ID_2;")
        echo "You guessed it in $GUESS_COUNTER tries. The secret number was $SRANDOM. Nice job!"
            break
        elif [[ $Guess -gt $SRANDOM ]]; then
            echo "It's lower than that, guess again:"
        else
            echo "It's higher than that, guess again:"
        fi
    else
        echo "That is not an integer, guess again:"
    fi
done







#username | game_id | game_played | guest_count | secret_number
