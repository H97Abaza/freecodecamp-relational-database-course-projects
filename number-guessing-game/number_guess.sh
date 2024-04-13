#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess -t --no-align -c"
SECRET_NUMBER=$(( $RANDOM%1000+1 ))
echo "Enter your username:"
read USERNAME
USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USERNAME'")
if [[ -n $USER_ID ]]
then
    echo $($PSQL "SELECT COUNT(*) ,MIN(number_of_guesses) FROM games GROUP BY user_id HAVING user_id=$USER_ID"|
    sed -E 's/([0-9]+)\|([0-9]+)/Welcome back, '$USERNAME'! You have played \1 games, and your best game took \2 guesses./')
else
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    INSERT_RESULT=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME')")
    if [[ $INSERT_RESULT = 'INSERT 0 1' ]]
    then
        USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USERNAME'")
        echo user id: $USER_ID
    fi
fi
NUMBER_OF_GUESSES=0
PLAY(){
    if [[ $1 ]];then
        echo "$1"
    else
        echo "Guess the secret number between 1 and 1000:"
    fi
    read GUESS
    NUMBER_OF_GUESSES=$(( ++NUMBER_OF_GUESSES ))
    if [[ $GUESS =~ ^([0-9]+)$ ]]
    then
        if [[ $GUESS -lt $SECRET_NUMBER ]]
        then
            PLAY "It's higher than that, guess again:"
        elif [[ $GUESS -gt $SECRET_NUMBER ]]
        then
            PLAY "It's lower than that, guess again:"
        else 
            echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
            QUERY_RESULT=$($PSQL "INSERT INTO games(user_id,number_of_guesses,secret_number) VALUES($USER_ID,$NUMBER_OF_GUESSES,$SECRET_NUMBER)")

        fi
    else
        PLAY "That is not an integer, guess again:"
    fi
}
PLAY
