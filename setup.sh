#!/bin/bash


#needs sed for upating  /etc/yum.repos.d/CentOS-Base.repo

curl -O http://yum.postgresql.org/9.2/redhat/rhel-6-x86_64/pgdg-centos92-9.2-6.noarch.rpm
rpm -ivh pgdg-centos92-9.2-6.noarch.rpm

yum install postgresql92-server postgresql92-contrib postgresql92-devel
yum install postgis2_92

service postgresql-9.2 initdb
service postgresql-9.2 start
chkconfig postgresql-9.2 on

#sed for updating /var/lib/pgsql/9.2/data/pg_hba.conf  allow local connections

service postgresql-9.2 restart

psql -U postgres -c "CREATE DATABASE template_postgis"

psql -U postgres -d template_postgis -c "CREATE EXTENSION postgis;"
psql -U postgres -d template_postgis -c "CREATE EXTENSION postgis_topology;"

service postgresql-9.2 restart

#todo's
#get sde install from private s3 bucket
#install
#provision
#setup with python?
#get backup from s3 bucket
#add appropaite users
#restore


#sed for updating /var/lib/pgsql/9.2/data/pg_hba.conf  local connections md5
