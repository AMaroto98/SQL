-- 1) Find all pizzerias frequented by at least one person under the age of 18. 

SELECT Frequents.pizzeria 
FROM Frequents, Person 
WHERE Person.age < 18 AND 
Frequents.name = Person.name;

-- 2) Find the names of all females who eat either mushroom or pepperoni pizza (or both).

SELECT DISTINCT Person.name 
FROM Person, Eats 
WHERE (Person.gender = "female" AND (Eats.pizza = "mushroom" OR Eats.pizza = "pepperoni")) AND 
Eats.name = Person.name;

-- 3) Find the names of all females who eat both mushroom and pepperoni pizza. Solve it using the same approach we used with relational algebra. Then solve it using “exists” and/or “not exists”.

-- No hace falta añadir Person en las subconsultas porque ya está en el primer Select.

SELECT name 
FROM Person
WHERE gender = "female" 
AND EXISTS (SELECT name 
            FROM Eats
            WHERE Eats.name = Person.name
            AND pizza = "mushroom")
AND EXISTS (SELECT name
            FROM Eats
            WHERE Eats.name = Person.name
            AND pizza = "pepperoni");

-- 4) Find all pizzerias that serve at least one pizza that Amy eats for less than $10.00. Solve it using the same approach we used with relational algebra. Then solve it using “exists” and/or “not exists”.

SELECT pizzeria 
FROM Serves
WHERE price < 10 
AND EXISTS (SELECT name 
            FROM Eats
            WHERE name = "Amy" 
            AND Serves.pizza = Eats.pizza)

-- 5) Find all pizzerias that are frequented by only females or only males.

((SELECT pizzeria
FROM Frequents
WHERE EXISTS (SELECT name
              FROM Person
              WHERE Person.gender = "female"
              AND Person.name = Frequents.name))

EXCEPT

(SELECT pizzeria
FROM Frequents
WHERE EXISTS (SELECT name
              FROM Person
              WHERE Person.gender = "male"
              AND Person.name = Frequents.name)))


UNION

((SELECT pizzeria
FROM Frequents
WHERE EXISTS (SELECT name
              FROM Person
              WHERE Person.gender = "male"
              AND Person.name = Frequents.name))

EXCEPT

(SELECT pizzeria
FROM Frequents
WHERE EXISTS (SELECT name
              FROM Person
              WHERE Person.gender = "female"
              AND Person.name = Frequents.name)))

-- 6) For each person, find all pizzas the person eats that are not served by any pizzeria the person frequents. Return all such person (name) / pizza pairs. Solve it using the same approach we used with relational algebra. Then solve it using “exists” and/or “not exists”.

(SELECT name, pizza
FROM Eats
WHERE EXISTS (SELECT name 
              FROM Frequents
              WHERE Eats.name = Frequents.name))

EXCEPT

-- Primera parte es correcta. Falla la de abajo.

(SELECT Frequents.name, Serves.pizza FROM Frequents, Serves WHERE Frequents.pizzeria = Serves.pizzeria);





(SELECT Eats.name, Eats.pizza FROM Eats, Frequents WHERE Eats.name = Frequents.name)

EXCEPT

(SELECT Frequents.name, Serves.pizza FROM Frequents, Serves WHERE Frequents.pizzeria = Serves.pizzeria);



-- 7) Find the names of all people who frequent only pizzerias serving at least one pizza they eat. Solve it using the same approach we used with relational algebra. Then solve it using “exists” and/or “not exists”.



-- 8) Find the names of all people who frequent every pizzeria serving at least one pizza they eat. Solve it using the same approach we used with relational algebra. Then solve it using “exists” and/or “not exists”.



-- 9) Find the pizzeria serving the cheapest pepperoni pizza. In the case of ties, return all of the cheapest-pepperoni pizzerias. Solve it using the same approach we used with relational algebra. Then solve it using a subquery

