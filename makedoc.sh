#!/usr/bin/env bash

## MEMO
# hub clone -p -b gh-pages momonga-project/api _deploy
##

WORKING_DIR=${0%/*}

cd $WORKING_DIR

php composer.phar self-update
if [ ! -d $WORKING_DIR/vendor ]; then
  php composer.phar install
else
  php composer.phar update
fi

pushd $WORKING_DIR/_momonga
git pull --rebase
popd

./vendor/bin/sami.php update "${WORKING_DIR}/sami.php"

pushd $WORKING_DIR/_deploy
git add .
git commit -a -m 'Update document.'
git push origin gh-pages
popd
