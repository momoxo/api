#!/usr/bin/env bash

WORKING_DIR=${0%/*}

echo $WORKING_DIR

cd $WORKING_DIR

php composer.phar self-update

if [ ! -d $WORKING_DIR/vendor ]; then
  php composer.phar install
else
  php composer.phar update
fi

./vendor/bin/sami.php update "${WORKING_DIR}/sami.php"
