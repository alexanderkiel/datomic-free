#!/usr/bin/env bash

sed "/host=0.0.0.0/a alt-host=${ALT_HOST:-127.0.0.1}" -i transactor.properties

sed "s/# storage-admin-password=/storage-admin-password=${DB_PASSWORD:-my-pwd}/" -i transactor.properties
sed "s/# storage-datomic-password=/storage-datomic-password=${DB_PASSWORD:-my-pwd}/" -i transactor.properties

if [ -n "$DB_OLD_PASSWORD" ]
then
  sed "s/# old-storage-admin-password=/old-storage-admin-password=$DB_OLD_PASSWORD/" -i transactor.properties
  sed "s/# old-storage-datomic-password=/old-storage-datomic-password=$DB_OLD_PASSWORD/" -i transactor.properties
fi

bin/transactor transactor.properties
