-- IS 362 Assignment 1
-- 1.How many airplanes have listed speeds?
 SELECT COUNT(speed) from planes;
 -- Answer: 23
 
-- What is the minimum listed speed and the maximum listed speed?
SELECT MIN(speed), MAX(speed) from planes;
-- Answer: minimum listed speed is 90, maximum is 432

-- 2.What is the total distance flown by all of the planes in January 2013?
SELECT sum(distance) FROM flights WHERE (year = '2013') AND (month = '1');
  -- Answer: 27188805

-- What is the total distance flown by all of the planes in January 2013 where the tailnum is missing?
SELECT sum(distance) FROM flights WHERE (year = '2013') AND (month = '1') AND tailnum is NULL;

-- 3. What is the total distance flown for all planes on July 5, 2013 grouped by aircraft manufacturer?  Write this statement first using an INNER JOIN, then using a LEFT 
-- OUTER JOIN.  How do your results compare?
SELECT planes.manufacturer, SUM(flights.distance) FROM flights INNER JOIN planes ON planes.tailnum = flights.tailnum WHERE flights.year = '2013' AND flights.month ='7' AND flights.day ='5' GROUP BY planes.manufacturer;
SELECT planes.manufacturer, SUM(flights.distance) FROM flights LEFT OUTER JOIN planes ON planes.tailnum = flights.tailnum WHERE flights.year = '2013' AND flights.month = '7' AND flights.day ='5'GROUP BY planes.manufacturer;
-- Answer: The inner join query does not contain any rows with a NULL value, but the left outer join does.

-- 4. Write and answer at least one question of your own choosing that joins information from at least three of the tables in the flights database.
-- How many airlines have a destination of IAD in the month of March?
SELECT COUNT(flights.tailnum), airlines.name, flights.dest FROM flights LEFT JOIN planes ON flights.tailnum = planes.tailnum LEFT JOIN airlines ON flights.carrier = airlines.carrier WHERE dest = 'IAD'and flights.month = '3' GROUP BY flights.dest, airlines.name;

