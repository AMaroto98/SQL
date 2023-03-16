Open 2 connections to your MariaDB DBMS.

In connection #0:
MariaDB [(none)]> create database deadlock;
Query OK, 1 row affected (0,001 sec)

MariaDB [(none)]> use deadlock;
Database changed
MariaDB [deadlock]> 

In connection #1:
MariaDB [(none)]> use deadlock;
Database changed
MariaDB [deadlock]>

In connection #0
MariaDB [deadlock]> create table numbers (
    -> number int not null PRIMARY KEY
    -> ) ENGINE=INNODB;
Query OK, 0 rows affected (0,022 sec)

MariaDB [deadlock]> insert into numbers values (1,2,3,4,5);
ERROR 1136 (21S01): Column count doesn t match value count at row 1
MariaDB [deadlock]> insert into numbers values (1),(2),(3),(4),(5);
Query OK, 5 rows affected (0,004 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [deadlock]> set autocommit=off;
Query OK, 0 rows affected (0,001 sec)

MariaDB [deadlock]> insert into numbers values (6);
Query OK, 1 row affected (0,001 sec)

MariaDB [deadlock]> select * from numbers;
+--------+
| number |
+--------+
|      1 |
|      2 |
|      3 |
|      4 |
|      5 |
|      6 |
+--------+
6 rows in set (0,001 sec)

MariaDB [deadlock]> 

Now repeat the select in connection #1:
MariaDB [deadlock]> select * from numbers;
+--------+
| number |
+--------+
|      1 |
|      2 |
|      3 |
|      4 |
|      5 |
+--------+
5 rows in set (0,001 sec)

MariaDB [deadlock]> 

Now execute a commit in session #0:
MariaDB [deadlock]> commit;
Query OK, 0 rows affected (0,004 sec)

MariaDB [deadlock]>

And repeat the select in session #1:
MariaDB [deadlock]> select * from numbers;
+--------+
| number |
+--------+
|      1 |
|      2 |
|      3 |
|      4 |
|      5 |
|      6 |
+--------+
6 rows in set (0,001 sec)

In session #1, begin a transaction and delete all the rows of the table:
MariaDB [deadlock]> begin;
Query OK, 0 rows affected (0,001 sec)

MariaDB [deadlock]> delete from numbers;
Query OK, 6 rows affected (0,001 sec)

MariaDB [deadlock]> 

In session #0, show the contents of the table:
MariaDB [deadlock]> select * from numbers;
+--------+
| number |
+--------+
|      1 |
|      2 |
|      3 |
|      4 |
|      5 |
|      6 |
+--------+
6 rows in set (0,001 sec)

MariaDB [deadlock]> 

In session #1 execute a rollback and show the contents of the table.
MariaDB [deadlock]> rollback;
Query OK, 0 rows affected (0,002 sec)

MariaDB [deadlock]> select * from numbers;
+--------+
| number |
+--------+
|      1 |
|      2 |
|      3 |
|      4 |
|      5 |
|      6 |
+--------+
6 rows in set (0,001 sec)

MariaDB [deadlock]>


In session #0 run an update to change number 6 to a 7.
MariaDB [deadlock]> update numbers set number=7 where number=6;
Query OK, 1 row affected (0,003 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [deadlock]>

In session #1 run an update to change number 6 to an 8. Wait until timeout.
MariaDB [deadlock]> update numbers set number=8 where number=6;
ERROR 1205 (HY000): Lock wait timeout exceeded; try restarting transaction
MariaDB [deadlock]> 

In session #0 execute a rollback
MariaDB [deadlock]> rollback;
Query OK, 0 rows affected (0,001 sec)

In session #0 change (again) the number 6 to a 7.
MariaDB [deadlock]> update numbers set number=7 where number=6;
Query OK, 1 row affected (0,001 sec)
Rows matched: 1  Changed: 1  Warnings: 0

In session #1 change number 5 to a 6.
MariaDB [deadlock]> update numbers set number=6 where number=5;
Then, in session #0 quickly attempt to change value 5 to a 7.
MariaDB [deadlock]> update numbers set number=7 where number=5;
ERROR 1062 (23000): Duplicate entry '7' for key 'PRIMARY'
MariaDB [deadlock]> 

Look at the output on session #1:
ERROR 1213 (40001): Deadlock found when trying to get lock; try restarting transaction

In session #0:
MariaDB [deadlock]> update numbers set number=7 where number=1;
Query OK, 1 row affected (0,001 sec)
Rows matched: 1  Changed: 1  Warnings: 0

In session #1:
MariaDB [deadlock]> begin;
Query OK, 0 rows affected (0,001 sec)

MariaDB [deadlock]> update numbers set number=8 where number=2;
Query OK, 1 row affected (0,001 sec)
Rows matched: 1  Changed: 1  Warnings: 0

In session #0:
MariaDB [deadlock]> update numbers set number=9 where number=2;
Query OK, 1 row affected (10,796 sec)
Rows matched: 1  Changed: 1  Warnings: 0

Look at the output of session #1:
ERROR 1213 (40001): Deadlock found when trying to get lock; try restarting transaction
MariaDB [deadlock]> 




