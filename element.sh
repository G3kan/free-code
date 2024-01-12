#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then 

echo "Please provide an element as an argument."

else

  if [[ $1 =~ ^[0-9]*$ ]];
  then
  
    TYPE_N=$($PSQL "SELECT typ FROM properties INNER JOIN elements USING(atomic_number) WHERE atomic_number=$1;")
  
    if [[ -z $TYPE_N ]]
    then
      echo "I could not find that element in the database."
    else 
      ATOMIC_MASS_N=$($PSQL "SELECT atomic_mass FROM properties INNER JOIN elements USING(atomic_number) WHERE atomic_number=$1;")
      MEL_P_N=$($PSQL "SELECT melting_point_celsius FROM properties INNER JOIN elements USING(atomic_number) WHERE atomic_number=$1;")
      BOI_P_N=$($PSQL "SELECT boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) WHERE atomic_number=$1;")
      SYMBOL_N=$($PSQL "SELECT symbol FROM properties INNER JOIN elements USING(atomic_number) WHERE atomic_number=$1;")
      NAME_N=$($PSQL "SELECT name FROM properties INNER JOIN elements USING(atomic_number) WHERE atomic_number=$1;")
    
      echo -e "The element with atomic number $1 is $NAME_N ($SYMBOL_N). It's a $TYPE_N, with a mass of $ATOMIC_MASS_N amu. $NAME_N has a melting point of $MEL_P_N celsius and a boiling point of $BOI_P_N celsius."
    
    fi

  elif [[ $1 =~ ^[A-Z]$ || $1 =~ ^[A-Z][a-z]$ ]]
  then
  
    TYPE_S=$($PSQL "SELECT typ FROM properties INNER JOIN elements USING(atomic_number) WHERE symbol='$1';")
  
    if [[ -z $TYPE_S ]]
    then
      echo "I could not find that element in the database."
    else 
      ATOMIC_MASS_S=$($PSQL "SELECT atomic_mass FROM properties INNER JOIN elements USING(atomic_number) WHERE symbol='$1';")
      MEL_P_S=$($PSQL "SELECT melting_point_celsius FROM properties INNER JOIN elements USING(atomic_number) WHERE symbol='$1';")
      BOI_P_S=$($PSQL "SELECT boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) WHERE symbol='$1';")
      ATOMIC_NUMBER_S=$($PSQL "SELECT atomic_number FROM properties INNER JOIN elements USING(atomic_number) WHERE symbol='$1';")
      NAME_S=$($PSQL "SELECT name FROM properties INNER JOIN elements USING(atomic_number) WHERE symbol='$1';")
    
      echo -e "The element with atomic number $ATOMIC_NUMBER_S is $NAME_S ($1). It's a $TYPE_S, with a mass of $ATOMIC_MASS_S amu. $NAME_S has a melting point of $MEL_P_S celsius and a boiling point of $BOI_P_S celsius."
    
    fi

  elif [[ $1 =~ ^[A-Z][a-z]{2,}$ ]]
  then
    TYPE_NA=$($PSQL "SELECT typ FROM properties INNER JOIN elements USING(atomic_number) WHERE name='$1';")
  
    if [[ -z $TYPE_NA ]]
    then
    echo "I could not find that element in the database."
    else 
      ATOMIC_MASS_NA=$($PSQL "SELECT atomic_mass FROM properties INNER JOIN elements USING(atomic_number) WHERE name='$1';")
      MEL_P_NA=$($PSQL "SELECT melting_point_celsius FROM properties INNER JOIN elements USING(atomic_number) WHERE name='$1';")
      BOI_P_NA=$($PSQL "SELECT boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) WHERE name='$1';")
      ATOMIC_NUMBER_NA=$($PSQL "SELECT atomic_number FROM properties INNER JOIN elements USING(atomic_number) WHERE name='$1';")
      SYMBOL_NA=$($PSQL "SELECT symbol FROM properties INNER JOIN elements USING(atomic_number) WHERE name='$1';")
    
      echo -e "The element with atomic number $ATOMIC_NUMBER_NA is $1 ($SYMBOL_NA). It's a $TYPE_NA, with a mass of $ATOMIC_MASS_NA amu. $1 has a melting point of $MEL_P_NA celsius and a boiling point of $BOI_P_NA celsius."
    
    fi


    else
      echo "I could not find that element in the database."
  fi
fi

