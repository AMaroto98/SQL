-- 1) What is the result of the following queries? Try to guess the result before trying them on a computer.

select null;

-- El resultado será Null

select null = 1;

-- El resultado seŕa Null

select null = null;

-- El resultado será Null

select (null=1) or (1=1);

-- El resultado es Null.
-- Antonio, espabila que el resultado es 1.

select (null=1) and (1=0);

-- El resultado es Null.
-- Antonio, espabila que el resultado es 0.

-- 2) Use the database sample at the end of this document. Try to guess the result of the following queries and then verify the result using the computer.

SELECT * FROM listofitem WHERE coname=NULL;

-- Empty set
-- Si se selecciona un null no sale nada.

SELECT * FROM listofitem WHERE coname<>NULL;

-- <> --> No es igual
-- Por qué no salen los dos que no son NULL?

-- Empty set

SELECT * FROM listofitem WHERE coname<=>NULL;

-- Al contrario que en el apartado anterior el operador <=> selecciona NUll

SELECT * FROM listofitem WHERE coname IS NULL;

-- Chocolate es la respuesta.

SELECT * FROM listofitem WHERE coname IS NOT NULL;

-- Selecciona las dos que no son Null.

SELECT * FROM listofitem WHERE coname = NULL OR NOT (coname = NULL);

-- Empty set. Mirar el motivo

SELECT * FROM listofitem WHERE coname NOT IN (NULL);

-- Empty set. Mirar el motivo

SELECT * FROM listofitem WHERE coname NOT IN (NULL, 'ABJ ENTERPRISE');

-- Empty set. Mirar el motivo

SELECT 0 IS UNKNOWN;

-- False

SELECT 1 IS UNKNOWN;

-- False

SELECT NULL IS UNKNOWN;

-- True

SELECT (NULL = NULL) IN UNKNOWN;

-- Null

SELECT coname FROM listofitem;

-- Lo esperado

SELECT CONCAT(coname, 'is the best') FROM listofitem;

-- Concaternar String con null da null

SELECT CONCAT(coname, 'is the best') is UNKNOWN FROM listofitem;

-- El primero como es null es desconocido por eso da TRUE dado de NULL ES DESCONOCIDO

-- Los otros dos dan false porque se conoce su valor.