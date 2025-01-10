#! /bin/bash

if [[ $1 == "test" ]]; then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

"$($PSQL "TRUNCATE TABLE games, teams;")"

#####
FILE="./games.csv"
IFS=',' read -r -a file_headers <<<"$(head -n 1 "$FILE")"

INSERTION_SUCCESS_RESP="INSERT 0 1"
#####
is_header?() {
  for i in $1; do
    if [[ " ${file_headers[@]} " =~ " $i " ]]; then
      return 0
    fi
  done
  return 1
}

upsert_team() {
  query=$($PSQL "SELECT * FROM teams WHERE name = '$1';")

  if [ -z "$query" ]; then
    insertion="$($PSQL "INSERT INTO teams(name) VALUES('$1');")"

    if [[ "$insertion" == $INSERTION_SUCCESS_RESP ]]; then
      echo "Inserted team: $1"
    fi
  fi
}

insert_game() {
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$3';")
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$4';")

  insertion="$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$1', '$2', '$WINNER_ID', '$OPPONENT_ID', '$5', '$6');")"

  if [[ "$insertion" == $INSERTION_SUCCESS_RESP ]]; then
    echo "Inserted game of year $1, round $2"
  fi
}

while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS; do
  values=($YEAR $ROUND $WINNER $OPPONENT $WINNER_GOALS $OPPONENT_GOALS)
  if is_header? ${values[@]} == 0; then
    continue
  fi

  upsert_team "$WINNER"
  upsert_team "$OPPONENT"

  insert_game "$YEAR" "$ROUND" "$WINNER" "$OPPONENT" "$WINNER_GOALS" "$OPPONENT_GOALS"
done <$FILE
