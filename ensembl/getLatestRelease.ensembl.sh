#!/usr/bin/sh
#
#A simple script that downloads and stores locally the cuurent release
# number of Ensembl database
#
# This will be scheduled on Jenkins to run dailly
#
cd `dirname $0`

SCRIPT_NAME=`basename $0`
WORKING_DIR=`pwd`


if [ ! -f ../Configuration ]
then
  echo "'Configuration' file missing under $WORKING_DIR."     
  exit 1
fi

source ../Configuration

release_readme_config="ensembl/ftp.ensembl.org.current_readme"

ENSEMBL_BASE="$EXTERNAL_DATA_BASE/$ENSEMBL_FTP_URL"
#setup the log
LOG_FILE="${DOWNLOADS_LOG_DIR}/$SCRIPT_NAME.log"
rm -rf $LOG_FILE
touch $LOG_FILE
date | tee -a $LOG_FILE
echo "**********              *******************" | tee -a $LOG_FILE
echo " Checking Ensembl Current Release Number"| tee -a $LOG_FILE
echo "**********  *******************************"| tee -a $LOG_FILE
echo ""| tee -a $LOG_FILE
echo " LOGS"| tee -a $LOG_FILE
echo "Logs generated by this script are under ${DOWNLOADS_LOG_DIR}"| tee -a $LOG_FILE
echo "Log: $SCRIPT_NAME.log"| tee -a $LOG_FILE
echo "Log: ftp.ensembl.org.current_readme.log"| tee -a $LOG_FILE
echo ""| tee -a $LOG_FILE
echo " FILES"| tee -a $LOG_FILE
echo "Files generated by this script are under ${ENSEMBL_BASE}"| tee -a $LOG_FILE
echo "File: latest_README"| tee -a $LOG_FILE


./../download_package $release_readme_config

echo ""| tee -a $LOG_FILE
echo ""| tee -a $LOG_FILE
echo "Program complete"| tee -a $LOG_FILE
echo "********** System dump *******************"| tee -a $LOG_FILE
echo " ENVIRONMENT VARIABLES DUMP"| tee -a $LOG_FILE
echo "**********  *******************************"| tee -a $LOG_FILE
env | tee -a $LOG_FILE
exit 0
