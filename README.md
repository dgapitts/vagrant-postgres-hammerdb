# vagrant postgres hammerdb (requires xwindows/x11)

This projects is for running postgres with hammerdb under vagrant, which require xWindows/x11 setup for the HammerDB GUI.

## extra manual steps

#### Sortout and test X11 forwarding

First here is work around for connecting directly as postgres with X11 forwarding:
```
[vagrant@postgres01 ~]$ sudo passwd postgres
```

Then after changing password for user postgres user, connect via

```
~/projects/vagrant-postgres-hammerdb $ ssh -X -p 2222 postgres@localhost
postgres@localhost's password:
``` 

I then test x11 access via running xclock:

```
~/projects/vagrant-postgres-hammerdb $ ssh -X -p 2222 postgres@localhost
postgres@localhost's password:
Last login: Wed Sep 30 11:03:00 2015 from 10.0.2.2
[postgres01:postgres:~] #xclock
```

#### next install HammerDB

Assuming you have download the HammerDB install code to /vagrant

```
cd /vagrant
./HammerDB-2.18-Linux-x86-64-Install
```

I went with the default installation path (i.e. /var/lib/pgsql/HammerDB-2.18/).

#### Two fixes to allow HammerDB to connect to default postgres user

Before you run HammerDB, you need to make 2 changes to postgres

1) vi /var/lib/pgsql/data/pg_hba.conf # allow connection for localhost
```

# TYPE  DATABASE    USER        CIDR-ADDRESS          METHOD
# "local" is for Unix domain socket connections only
local   all         all                               ident
# IPv4 local connections:
# host    all         all         127.0.0.1/32          ident
host    all     all     127.0.0.1/32                    md5
# IPv6 local connections:
# host    all         all         ::1/128               ident
host    all     all             ::1/128                 md5
```

2) not sure what the default password for the postgres user is, but HammerDB expected it to be postgres

```
[postgres01:postgres:~] #psql
psql (8.4.20)
Type "help" for help.

postgres=# ALTER USER postgres WITH PASSWORD 'postgres';
ALTER ROLE
```

#### Finally start HammerDB

```
cd /var/lib/pgsql/HammerDB-2.18/
./hammerdb.tcl
```