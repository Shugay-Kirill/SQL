CREATE database hw5;
use hw5;
CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT * FROM cars;
#1. Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов
use hw5;
create view view_cars as
SELECT name, cost
from cars
WHERE cost <= 25000;
#1.Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)
alter view view_cars as 
SELECT name, cost
from cars
WHERE cost <= 30000;
#2.Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди” (аналогично)
alter view view_cars as 
SELECT name, cost
from cars
WHERE name = "Audi" or name = "Skoda";
/*
Доп задания:
1* Получить ранжированный список автомобилей по цене в порядке возрастания
*/
alter view view_cars as 
SELECT  name, cost,
ROW_NUMBER()
over(order by cost)
from cars;
# 2* Получить топ-3 самых дорогих автомобилей, а также их общую стоимость
alter view view_cars as 
SELECT  name, cost, sum(cost)
over(order by cost desc)
from cars
limit 3;


