#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table -t -c"
if [[ -z $1  ]]
then
	echo "Please provide an element as an argument."
else
	QUERY="
	SELECT atomic_number,name,symbol,type AS t,atomic_mass,melting_point_celsius,boiling_point_celsius FROM elements 
	INNER JOIN properties USING(atomic_number) 
	INNER JOIN types USING(type_id) WHERE "
	if [[ $1 =~ ^[0-9]+$ ]]
	then
		QUERY+="atomic_number=$1"
	elif [[ $1 =~ ^[A-Z][A-Za-z]?$ ]]
	then
		QUERY+="symbol='$1'"
	else
		QUERY+="name='$1'"
	fi
	QUERY_RESULT=$($PSQL "$QUERY")
	if [[ -n $QUERY_RESULT ]]
	then
		echo $QUERY_RESULT | sed  's/| //g'| while read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT
		do
			echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
		done
	else
		echo "I could not find that element in the database."
	fi
fi