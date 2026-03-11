#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read YEAR ROUND WINNER OPP W_GOALS O_GOALS
do
  if [[ $YEAR != 'year' ]]
  then
    
    WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER' ")
    if [[ -z $WINNER_ID ]]
    then
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER') ")
      if [[ $INSERT_WINNER_RESULT = 'INSERT 0 1' ]]
      then
        echo "inserted $WINNER"
        WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER' ")
      fi
    fi
    
    OPP_ID=$($PSQL "select team_id from teams where name='$OPP'")
    if [[ -z $OPP_ID ]]
    then
      INSERT_OPP_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPP') ")
      if [[ $INSERT_OPP_RESULT = 'INSERT 0 1' ]]
      then
        echo "inserted $OPP"
        OPP_ID=$($PSQL "select team_id from teams where name='$OPP' ")
      fi
    fi

    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year,round,winner_goals,opponent_goals,winner_id,opponent_id) values('$YEAR','$ROUND','$W_GOALS','$O_GOALS','$WINNER_ID','$OPP_ID')")
    if [[ $INSERT_GAME_RESULT = 'INSERT 0 1' ]]
    then
      echo "inserted $YEAR, $ROUND, $W_GOALS, $O_GOALS, $WINNER_ID, $OPP_ID"
    fi
  fi
done