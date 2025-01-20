#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]; then
    echo "Please provide an element as an argument."
else
    if [[ $1 =~ ^[0-9]+$ ]]; then
        query="SELECT e.atomic_number, e.symbol, e.name, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius
           FROM elements e
           FULL JOIN properties p ON p.atomic_number = e.atomic_number
           FULL JOIN types t ON t.type_id = p.type_id
           WHERE e.atomic_number = $1;"
    else
        query="SELECT e.atomic_number, e.symbol, e.name, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius
           FROM elements e
           FULL JOIN properties p ON p.atomic_number = e.atomic_number
           FULL JOIN types t ON t.type_id = p.type_id
           WHERE e.symbol = '$1' OR e.name = '$1';"
    fi

    element=$($PSQL "$query")

    if [[ -z $element ]]; then
        echo "I could not find that element in the database."
    else
        echo "$element" | while IFS="|" read -r ATOMIC_NUMBER SYMBOL NAME TYPE MASS MELTING_POINT BOILING_POINT; do
            echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
        done
    fi
fi
