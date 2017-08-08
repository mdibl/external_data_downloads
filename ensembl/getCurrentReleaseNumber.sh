#!/bin/sh

# This script returns the release number

cd `dirname $0`

SCRIPT_NAME=`basename $0`
WORKING_DIR=`pwd`

source ../Configuration
source ./ensembl.cfg

RELEASE_BASE=$EXTERNAL_DATA_BASE/$SHORT_NAME
RELEASE_NUMBER=0
if [ -d $RELEASE_BASE ]
then
  cd $RELEASE_BASE
  RELEASE_NUMBER=`ls | grep current_release_NUMBER | sed 's/current_release_NUMBER.//'`
fi
echo "$RELEASE_NUMBER"

exit 0



