
-- 1) Find all pizzerias frequented by at least one person under the age of 18.

SELECT Frequents.pizzeria FROM Frequents, Person WHERE Person.age < 18 AND Frequents.name = Person.name;

-- 2) Find the names of all females who eat either mushroom or pepperoni pizza (or both). person y eats

SELECT DISTINCT Person.name FROM Person, Eats WHERE (Person.gender = "female" AND (Eats.pizza = "mushroom" OR Eats.pizza = "pepperoni")) AND Eats.name = Person.name;

-- 3) Find the names of all females who eat both mushroom and pepperoni pizza.

(SELECT Person.name FROM Person, Eats WHERE (Person.gender = "female" AND (Eats.pizza = "mushroom")) AND Eats.name = Person.name)

INTERSECT

(SELECT Person.name FROM Person, Eats WHERE (Person.gender = "female" AND (Eats.pizza = "pepperoni")) AND Eats.name = Person.name);

-- 4) Find all pizzerias that serve at least one pizza that Amy eats for less than $10.00.                    eats SERVES

SELECT Serves.pizzeria FROM Eats, Serves WHERE (Serves.price < 10 AND Eats.name = "Amy") AND Eats.pizza = Serves.pizza;

-- 5) Find all pizzerias that are frequented by only females or only males.  Person ⨝ Frequents))

(SELECT Frequents.pizzeria FROM Person, Frequents WHERE Person.gender = "female" AND Person.name = Frequents.name

EXCEPT

SELECT Frequents.pizzeria FROM Person, Frequents WHERE Person.gender = "male" AND Person.name = Frequents.name)

UNION

(SELECT Frequents.pizzeria FROM Person, Frequents WHERE Person.gender = "male" AND Person.name = Frequents.name

EXCEPT

SELECT Frequents.pizzeria FROM Person, Frequents WHERE Person.gender = "female" AND Person.name = Frequents.name);

-- 6) For each person, find all pizzas the person eats that are not served by any pizzeria the person frequents. Return all such person (name) / pizza pairs.



-- 7) Find the names of all people who frequent only pizzerias serving at least one pizza they eat.



-- 8) Find the names of all people who frequent every pizzeria serving at least one pizza they eat.



-- 9) Find the pizzeria serving the cheapest pepperoni pizza. In the case of ties, return all of the cheapest-pepperoni pizzerias.

