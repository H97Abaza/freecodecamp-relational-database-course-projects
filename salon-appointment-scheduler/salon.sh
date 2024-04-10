#! /bin/bash
echo -e "\n~~~~~ MY SALON ~~~~~\n"
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
TRIM(){
    if [[ -n $1 ]]
    then
    echo -e "$1"| sed -E 's/^ *| *$//g'
    fi
}
GET_SERVICE(){
    read SERVICE_ID_SELECTED
    if [[ $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
        SERVICE_ID_SELECTED_RESULT=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    fi
    # service not found
    if [[ -z $SERVICE_ID_SELECTED_RESULT ]]
    then
        MAIN_MENU "\nI could not find that service. What would you like today?"
    else
        echo -e "\nWhat's your phone number?"
        read CUSTOMER_PHONE
        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
        # if not found
        if [[ -z $CUSTOMER_NAME ]]
        then
            echo -e "\nI don't have a record for that phone number, what's your name?"
            read CUSTOMER_NAME
            CUSTOMER_NAME_INSERT_RESULT=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
        fi
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
        SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
        echo -e "\nWhat time would you like your $(TRIM $SERVICE_NAME), $(TRIM $CUSTOMER_NAME)?"
        read SERVICE_TIME
        SERVICE_TIME_INSERT_RESULT=$($PSQL "INSERT INTO appointments(service_id,customer_id,time) VALUES($SERVICE_ID_SELECTED,$CUSTOMER_ID,'$SERVICE_TIME')")
        if [[ -n $SERVICE_TIME_INSERT_RESULT ]]
        then
            echo -e "\nI have put you down for a $(TRIM $SERVICE_NAME) at $(TRIM $SERVICE_TIME), $(TRIM $CUSTOMER_NAME)."
        fi
    fi
}
MAIN_MENU(){
    if [[ -n $1 ]]
    then
        echo -e "$1"
    else
        echo -e "Welcome to My Salon, how can I help you?\n"
    fi
    echo -e "$($PSQL "SELECT * FROM services ORDER BY service_id" | while read SERVICE_ID PIPE SERVICE_NAME
    do 
        if [[ -n $SERVICE_ID ]]
        then
            echo "$SERVICE_ID) $SERVICE_NAME"
        fi
    done)"
    GET_SERVICE
}
MAIN_MENU