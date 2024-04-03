#! /bin/bash
clear
if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo "$($PSQL "TRUNCATE TABLE teams,games")";

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # If not first line
  if [[ $YEAR != 'year' ]]
  then
    # Vars initializtion
    QUERY='INSERT INTO teams(name) VALUES'
    VALUES=''

    echo -e "\n- $WINNER vs $OPPONENT"
    # get winner id if already exist
    WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")"
    echo Winner: $WINNER id: $WINNER_ID

    # add winner to insert query if not already exist
    if [[ -z $WINNER_ID ]]
    then
      VALUES+="('$WINNER')"
    fi

    # get opponent id if already exist
    OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")"
    echo Oponent: $OPPONENT id: $OPPONENT_ID
    
    # add opponent to insert query if not already exist
    if [[ -z $OPPONENT_ID ]]
    then
      if [[ -z $WINNER_ID ]]
      then
        VALUES+=","
      fi
      VALUES+="('$OPPONENT')"
    fi
    if [[ -z $VALUES ]]
    then
      QUERY=''
    else
      QUERY+=$VALUES
    fi
    # echo VALUES= $VALUES
    # echo QUERY= $QUERY
    INSERT_TEAMS_RESULT="$($PSQL "$QUERY")"
    INSERT_TEAMS_RESULT=${INSERT_TEAMS_RESULT: -2:2}
    [[ -n $INSERT_TEAMS_RESULT ]] && echo Inserted $INSERT_TEAMS_RESULT teams

    # get missed id if any
    if [[ -z $WINNER_ID ]]
    then
      WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")"
    fi
    if [[ -z $OPPONENT_ID ]]
    then
      OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")"
    fi

    # insert row to games table
    QUERY="INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES("$YEAR",'"$ROUND"',"$WINNER_ID","$OPPONENT_ID","$WINNER_GOALS","$OPPONENT_GOALS")"
    INSERT_INTO_GAMES_RESULT="$($PSQL "$QUERY")"
    echo $( [[ $INSERT_INTO_GAMES_RESULT  = 'INSERT 0 1' ]] && echo -e "Inserted into games: $WINNER vs $OPPONENT : $WINNER_GOALS - $OPPONENT_GOALS\n" || echo -e "\n" )
  fi
done