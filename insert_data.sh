#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql -X --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql -X --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi


# Do not change code above this line. Use the PSQL variable above to query your database.
$PSQL "TRUNCATE teams,games"

cat games.csv | while IFS=',' read year round winner opponent winner_goals opponent_goals
do 
#test value not year
 if [[ $year != "year" ]];
 then
  winner_id=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")
  opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")
   if [[ -z $winner_id ]]
   then
   INSERTED=$($PSQL "INSERT INTO teams(name) VALUES('$winner')")
    if [[ $INSERTED == "INSERT 0 1" ]]
    then
    echo "Inserted into winner, $winner"
    fi
   fi
  
   if [[ -z $opponent_id ]]
   then
    INSERTED_OP=$($PSQL "INSERT INTO teams(name) VALUES('$opponent')")
    if [[ $INSERTED_OP == "INSERT 0 1" ]]
    then
    echo "Inserted into opponent, $opponent"
     fi
    fi  
  fi

done


cat games.csv | while IFS=',' read year round winner opponent winner_goals opponent_goals
do

 if [[ $year != "year" ]];
 then
 winner_id_2=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")
 opponent_id_2=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")
 $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ('$year', '$round',$winner_id_2, $opponent_id_2, $winner_goals, $opponent_goals)"
 echo $year $round $winner_id_2 $opponent_id_2 $winner_goals $opponent_goals
  fi
done  

