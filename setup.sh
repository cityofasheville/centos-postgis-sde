#!/bin/bash


#needs sed for upating  /etc/yum.repos.d/CentOS-Base.repo

curl -O http://yum.postgresql.org/9.2/redhat/rhel-6-x86_64/pgdg-centos92-9.2-6.noarch.rpm
rpm -ivh pgdg-centos92-9.2-6.noarch.rpm

yum install postgresql92-server postgresql92-contrib postgresql92-devel
yum install postgis2_92

service postgresql-9.2 initdb
service postgresql-9.2 start
chkconfig postgresql-9.2 on

#sed for updating /var/lib/pgsql/9.2/data/pg_hba.conf  allow all connections

service postgresql-9.2 restart

CREATE EXTENSION postgis;
CREATE EXTENSION postgis_topology;

service postgresql-9.2 restart


#todo's
#get sde install from private s3 bucket
#install
#provision
#get backup from s3 bucket
#add appropaite users
#restore

