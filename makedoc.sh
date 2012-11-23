#!/usr/bin/env bash

set -eux

WORKING_DIR=${0%/*}

cd $WORKING_DIR

if [ -z "$(ls $WORKING_DIR/_momoxo/)" ]; then
  git submodule update --init
fi

if [ ! -d $WORKING_DIR/_deploy ]; then
  git clone -b gh-pages git://github.com/momoxo/api _deploy
fi

php composer.phar self-update
if [ ! -d $WORKING_DIR/vendor ]; then
  php composer.phar install
else
  php composer.phar update
fi

pushd $WORKING_DIR/_momoxo
  git pull --rebase origin master
popd

./vendor/bin/sami.php update "$WORKING_DIR/sami.php"

pushd $WORKING_DIR/_deploy
  rm -rf $WORKING_DIR/_deploy/*
  cp -a $WORKING_DIR/tmp/* $WORKING_DIR/_deploy
  git add .
  git add -u
  git commit -a -m 'Update document.'
  git push origin gh-pages
popd
