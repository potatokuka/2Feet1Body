#!/bin/bash

NAME="venmo_search"
kernel=$(uname)

WHITE="\x1b[37;01m"
CYAN="\x1b[36;01m"
PINK="\x1b[35;01m"
BLUE="\x1b[34;01m"
YELLOW="\x1b[33;01m"
GREEN="\x1b[32;01m"
RED="\x1b[31;01m"
BLACK="\x1b[30;01m"
RESET="\x1b[0m"
if [ "$kernel" = "Linux" ]; then
	WHITE="\033[37;01m"
	CYAN="\033[36;01m"
	PINK="\033[35;01m"
	BLUE="\033[34;01m"
	YELLOW="\033[33;01m"
	GREEN="\033[32;01m"
	RED="\033[31;01m"
	BLACK="\033[30;01m"
	RESET="\033[0m"
fi

search () {
	printf "Searching through the dataset for $CYAN$1$RESET...\n"
	mongo --eval "db.venmo.aggregate([{\$match: {'payment.note': \"$1\"}},{'\$out': 'collection_$1'}])" test
	mongoexport --collection=collection_$1 --db=test --out=../database/venmo_$1.json --fieldFile=venmo_entryfields
	echo "Results have been succesfully exported to ../database/venmo_$1.json!"
}

print_help () {
	printf "usage:		./$NAME [--help] [SEARCH]\n\n"
	echo "example:	./$NAME drugs"
}

FILE=/usr/local/bin/ #get all options
if [ $# -eq 1 ]; then
	if [ "$1" = "--help" ]; then
		print_help
		exit ;
	else
		search "$1"
	fi
elif [ $# -ne 0 ]; then
	echo "too many arguments"
	exit ;
fi
