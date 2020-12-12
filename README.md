# Operation Onymous

This is a project focussed on raising awareness of the privacy issues one can experience using the default settings on Venmo.

## Index
- [Operation Onymous](#operation-onymous)
	- [Index](#index)
	- [Introduction](#introduction)
	- [Research](#research)
	- [Usage](#usage)

## Introduction
Through the default settings of Venmo we were able to find information about people that should be kept private. By open-sourcing our research we hope to show people the dangers of keeping your data public.

## Research
Our given dataset came from [this](https://github.com/sa7mon/venmo-data) Venmo database. By sorting the data and searching for certain keywords we have narrowed down the list to filtered selections of buyers, sellers and the service(s) provided in the transaction.

## Usage
To use this tool you will need to install [MongoDB](https://www.mongodb.com/) first, this will be used to locally run the Venmo database.

After downloading the database from [venmo-data](https://github.com/sa7mon/venmo-data) you can run the `venmo_search.sh` as follows:
```bash
./venmo_search.sh <search_value>
```

After you can run the [python script](https://github.com/potatokuka/Operation_Onymous/blob/main/src/json_parse.py) this will ask you to specify a database file.
```bash
Operation_Onymous/src ❯ python3 json_parse.py
What database would you like to parse?
<database_name>
```

you do not have to include the `.json` extention when declaring the database name.