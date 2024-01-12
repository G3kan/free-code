#! /bin/bash

echo -e "\n~~~~~ MY SALON ~~~~~\n"

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

MAIN_MENU () {
if [[ $1 ]]
then 
echo -e "\n$1"
fi

echo -e "Welcome to My Salon, how can I help you?\n" 
echo -e "\n1) CUT\n2) COLOR\n3) PERM\n4) STYLE\n5) TRIM\n6) EXIT"
read SERVICE_ID_SELECTED

case $SERVICE_ID_SELECTED in
    1) CUT ;;
    2) COLOR ;;
    3) PERM ;;
    4) STYLE ;;
    5) TRIM ;;
    6) EXIT ;;
    *) MAIN_MENU "I could not find that service. What would you like today?\n";;
  esac
}

CUT () {
echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE
#search phone number
 
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
 
if [[ -z $CUSTOMER_ID ]]
then 
echo -e "\nI don't have a record for that phone number, what's your name?"
read CUSTOMER_NAME

echo -e "\nWhat time would you like your cut,$CUSTOMER_NAME?"
read SERVICE_TIME

INSERT_CUT=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")

CUSTOMER_ID_CUT=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

INSERT_AP=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES('$CUSTOMER_ID_CUT','1','$SERVICE_TIME')")

echo -e "\nI have put you down for a cut at $SERVICE_TIME, $CUSTOMER_NAME."

else 

CUSTOMER_ELSE_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

echo -e "\nWhat time would you like your cut,$CUSTOMER_ELSE_NAME?"

read ELSE_TIME

INSERT_AP=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES('$CUSTOMER_ID','1','$ELSE_TIME')")

echo -e "\nI have put you down for a cut at $ELSE_TIME, $CUSTOMER_ELSE_NAME."


fi
}


COLOR () {
  echo "COLOR"
}

PERM () {
  echo "PERM"
}

STYLE () {
  echo "STYLE"
}

TRIM() {
  echo "TRIM"
}


EXIT() {
  echo -e "\nThank you.\n"
}



MAIN_MENU
