#!/bin/sh

help()
{
   echo "Usage: $0 -U [username] -P [password] -N [dbname] -h [host] -p [port]"
   echo -e "\t-U db username"
   echo -e "\t-P db password"
   echo -e "\t-N db name"
   echo -e "\t-h db host"
   echo -e "\t-p db port"
   exit 1 # Exit script after printing help
}

while getopts "U:P:N:h:p:" opt
do
   case "$opt" in
      U ) Username="$OPTARG" ;;
      P ) Password="$OPTARG" ;;
      N ) DbName="$OPTARG" ;;
      h ) Host="$OPTARG" ;;
      p ) Port="$OPTARG" ;;
      ? ) help ;; # Print help function in case parameter is non-existent
   esac
done

# Print help function in case parameters are empty
if [ -z "$Username" ] || [ -z "$Password" ] || [ -z "$DbName" ] || [ -z "$Host" ] || [ -z "$Port" ]
then
   echo "Some or all of the parameters are empty";
   help
fi

CURRENTDATE=`date +"%Y-%m-%d_%T"`
BACKUPDIR="./prisma/backups/${CURRENTDATE}"

mkdir -p ${BACKUPDIR}
pg_dump "host=$Host port=$Port dbname=$DbName user=$Username password=$Password" > "$BACKUPDIR/$DbName.sql"


echo ""
echo "New backup was created: /backups/$CURRENTDATE/$DbName.sql";