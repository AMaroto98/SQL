-- 1) What is the result of the following queries? Try to guess the result before trying them on a computer.

select null;

+------+
| NULL |
+------+
| NULL |
+------+

select null = 1;

+----------+
| null = 1 |
+----------+
|     NULL |
+----------+

select null = null;

+-------------+
| null = null |
+-------------+
|        NULL |
+-------------+

select (null=1) or (1=1);

+-------------------+
| (null=1) or (1=1) |
+-------------------+
|                 1 |
+-------------------+

select (null=1) and (1=0);

+--------------------+
| (null=1) and (1=0) |
+--------------------+
|                  0 |
+--------------------+

-- 2) Use the database sample at the end of this document. Try to guess the result of the following queries and then verify the result using the computer.

SELECT * FROM listofitem WHERE coname=NULL;

Empty set (0,00 sec)

SELECT * FROM listofitem WHERE coname<>NULL;

Empty set (0,01 sec)

-- <> --> No es igual
-- Por qué no salen los dos que no son NULL?

SELECT * FROM listofitem WHERE coname<=>NULL;

+----------+---------------------------+-------------------------------------+--------+
| ITEMCODE | ITEMNAME                  | BATCHCODE                           | CONAME |
+----------+---------------------------+-------------------------------------+--------+
| I001     | CHOCOLATE                 | DM/2007-08/WBM%1                    | NULL   |
+----------+---------------------------+-------------------------------------+--------+

-- Al contrario que en el apartado anterior el operador <=> selecciona NUll

SELECT * FROM listofitem WHERE coname IS NULL;

+----------+---------------------------+-------------------------------------+--------+
| ITEMCODE | ITEMNAME                  | BATCHCODE                           | CONAME |
+----------+---------------------------+-------------------------------------+--------+
| I001     | CHOCOLATE                 | DM/2007-08/WBM%1                    | NULL   |
+----------+---------------------------+-------------------------------------+--------+

SELECT * FROM listofitem WHERE coname IS NOT NULL;

+----------+---------------------------+-------------------------------------+-------------------------------------+
| ITEMCODE | ITEMNAME                  | BATCHCODE                           | CONAME                              |
+----------+---------------------------+-------------------------------------+-------------------------------------+
| I003     | HOT DOG                   | DM/2007-08/WB1                      | ABJ ENTERPRISE                      |
| I002     | CONDENSED MILK            | DM/2007-08/WBM%2                    | ABJ CONCERN                         |
+----------+---------------------------+-------------------------------------+-------------------------------------+

-- Selecciona las dos que no son Null.

SELECT * FROM listofitem WHERE coname = NULL OR NOT (coname = NULL);

Empty set 

-- Mirar el motivo

SELECT * FROM listofitem WHERE coname NOT IN (NULL);

Empty set 

-- Mirar el motivo

SELECT * FROM listofitem WHERE coname NOT IN (NULL, 'ABJ ENTERPRISE');

-- Mirar el motivo

SELECT 0 IS UNKNOWN;

+--------------+
| 0 IS UNKNOWN |
+--------------+
|            0 |
+--------------+

-- False

SELECT 1 IS UNKNOWN;

+--------------+
| 1 IS UNKNOWN |
+--------------+
|            0 |
+--------------+

-- False

SELECT NULL IS UNKNOWN;

+-----------------+
| NULL IS UNKNOWN |
+-----------------+
|               1 |
+-----------------+

-- True

SELECT (NULL = NULL) IN UNKNOWN;

-- Null

SELECT coname FROM listofitem;

+-------------------------------------+
| coname                              |
+-------------------------------------+
| NULL                                |
| ABJ ENTERPRISE                      |
| ABJ CONCERN                         |
+-------------------------------------+

-- Lo esperado

SELECT CONCAT(coname, 'is the best') FROM listofitem;

+------------------------------------------------+
| CONCAT(coname, 'is the best')                  |
+------------------------------------------------+
| NULL                                           |
| ABJ ENTERPRISE                     is the best |
| ABJ CONCERN                        is the best |
+------------------------------------------------+

-- Concaternar String con null da null

SELECT CONCAT(coname, 'is the best') is UNKNOWN FROM listofitem;

+------------------------------------------+
| CONCAT(coname, 'is the best') is UNKNOWN |
+------------------------------------------+
|                                        1 |
|                                        0 |
|                                        0 |
+------------------------------------------+

-- El primero como es null es desconocido por eso da TRUE dado de NULL ES DESCONOCIDO

-- Los otros dos dan false porque se conoce su valor.