#! /bin/bash
###################################### AUX

INSERTION_SUCCESS_RESP="INSERT 0 1"
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

is_item_in_array() {
    local ITEM=$1
    shift
    local ARRAY=("$@")

    for i in "${ARRAY[@]}"; do
        if [[ "$i" == "$ITEM" ]]; then
            return 0
        fi
    done
    return 1
}

###################################### MENUS

SERVICE_MENU() {
    SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id ASC;")
    readarray -t SERVICES_IDS < <(echo "$SERVICES" | sed -E 's/[^0-9]//g')

    echo "$SERVICES" | while read ID PIPE NAME; do
        echo "$ID) $NAME"
    done

    read SERVICE_ID_SELECTED

    is_item_in_array "$SERVICE_ID_SELECTED" "${SERVICES_IDS[@]}"
    if [[ $? -eq 0 ]]; then
        PHONE_NUMBER_MENU
    else
        echo -e "\n"
        echo "I could not find that service. What would you like today?"

        SERVICE_MENU
    fi
}

PHONE_NUMBER_MENU() {
    echo -e "\n"
    echo "What's your phone number?"
    read CUSTOMER_PHONE

    if [[ -z $CUSTOMER_PHONE ]]; then
        PHONE_NUMBER_MENU
    else
        CUSTOMER=$($PSQL "SELECT customer_id, name, phone FROM customers c where c.phone = '$CUSTOMER_PHONE' LIMIT 1;")
        # if phone number not found, get name
        if [[ -z $CUSTOMER ]]; then
            NAME_MENU
        else
            echo "$CUSTOMER" | while read ID PIPE NAME PIPE PHONE; do
                TIME_MENU "$ID" "$NAME"
            done
        fi
    fi
}

NAME_MENU() {
    echo -e "\n"
    echo "We don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    if [[ -z $CUSTOMER_NAME ]]; then
        NAME_MENU
    else
        NEW_CUSTOMER_INSERTION=$($PSQL "INSERT INTO customers(name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE');")

        if [[ "$NEW_CUSTOMER_INSERTION" == $INSERTION_SUCCESS_RESP ]]; then
            NEW_CUSTOMER=$($PSQL "SELECT customer_id, name FROM customers c where c.phone = '$CUSTOMER_PHONE' LIMIT 1;")

            echo "$NEW_CUSTOMER" | while read ID PIPE NAME; do
                TIME_MENU "$ID" "$NAME"
            done
        else
            NAME_MENU
        fi
    fi
}

TIME_MENU() {
    local CUSTOMER_ID=$1
    local CUSTOMER_NAME=$2

    SELECTED_SERVICE=$($PSQL "SELECT service_id, name FROM services s where s.service_id = '$SERVICE_ID_SELECTED';")

    echo "$SELECTED_SERVICE" | while read ID PIPE NAME; do
        echo -e "\n"
        echo "What time would you like your $NAME, $CUSTOMER_NAME?"
    done
    read SERVICE_TIME </dev/tty

    if [[ -z $SERVICE_TIME ]]; then
        TIME_MENU "$CUSTOMER_ID" "$CUSTOMER_NAME"
    else
        NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ('$CUSTOMER_ID', '$SERVICE_ID_SELECTED', '$SERVICE_TIME');")

        if [[ "$NEW_APPOINTMENT" == $INSERTION_SUCCESS_RESP ]]; then
            echo "$SELECTED_SERVICE" | while read ID PIPE NAME; do
                echo -e "\n"
                echo "I have put you down for a $NAME at $SERVICE_TIME, $CUSTOMER_NAME."
            done
        else
            TIME_MENU "$CUSTOMER_ID" "$CUSTOMER_NAME"
        fi
    fi
}

######################################
echo -e "\n~~~~~ MY SALON ~~~~~~\n"

echo "Welcome to My Salon, how can I help you?"
echo -e "\n"

SERVICE_MENU
