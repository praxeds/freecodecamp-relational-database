#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

GENERATE_NUMBER() {
    MIN=1
    MAX=1000

    echo $((RANDOM % (MAX - MIN + 1) + MIN))
}

RANDOM_NUMBER=$(GENERATE_NUMBER)
GUESSES=1

UPSERT_USER() {
    if [[ -z $USER ]]; then
        $PSQL "INSERT INTO users(username, games_played, best_game) VALUES ('$USERNAME', 1, $GUESSES);" >/dev/null 2>&1

    else
        echo "$USER" | while IFS="|" read -r username games_played best_game; do
            ((games_played++))

            if ((GUESSES < best_game)); then
                best_game=$GUESSES
            fi

            $PSQL "UPDATE users SET games_played = $games_played, best_game = $best_game WHERE username = '$USERNAME';" >/dev/null 2>&1
        done
    fi
}

GUESSING_MENU() {
    read GUESS

    if [[ $GUESS =~ ^[0-9]+$ ]]; then
        if ((GUESS < RANDOM_NUMBER)); then
            ((GUESSES++))
            echo "It's higher than that, guess again:"
            GUESSING_MENU
        elif ((GUESS > RANDOM_NUMBER)); then
            ((GUESSES++))
            echo "It's lower than that, guess again:"
            GUESSING_MENU
        else
            UPSERT_USER
            echo "You guessed it in $GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
        fi
    else
        echo "That is not an integer, guess again:"
        GUESSING_MENU
    fi
}

MAIN_MENU() {
    echo "Enter your username:"
    read USERNAME

    if [[ $USERNAME =~ ^.{1,22}$ ]]; then
        USER=$($PSQL "SELECT username, games_played, best_game FROM users WHERE username = '$USERNAME';")

        if [[ -z $USER ]]; then
            echo "Welcome, $USERNAME! It looks like this is your first time here."
        else
            echo "$USER" | while IFS="|" read -r username games_played best_game; do
                echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
            done
        fi

        echo "Guess the secret number between 1 and 1000:"
        GUESSING_MENU
    else
        MAIN_MENU
    fi
}

MAIN_MENU
