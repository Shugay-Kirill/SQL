#1.Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
create database hw2;
use hw2;
create table sales
(
	id int primary key auto_increment,
    order_date date not null,
    count_product int not null
);

insert into sales (order_date, count_product)
values 
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);

-- 2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300, используя функцию IF
SELECT 
id as "id заказа",
	if (count_product < 100, "Маленький заказ",
		if ( count_product >= 100 and count_product <= 300, "Средний заказ","Большой заказ"))
as "Тип заказа"
from sales;

/*
3. Создайте таблицу “orders”, заполните ее значениями. 
Покажите “полный” статус заказа, используя оператор CASE
*/

create table orders
(
	id int primary key auto_increment,
    employee_id varchar(10) not null,
    amount decimal(10,2) not null, 
    order_status varchar(20) not null
);

insert into orders (employee_id,amount,order_status)
value
("e03", 15.00,"OPEN"),
("e01", 25.50,"OPEN"),
("e05", 100.70,"CLOSED"),
("e02", 22.18,"Open"),
("e04", 9.50,"CANCELLED");

select id, order_status,
	case
		when order_status = "OPEN"
			then "Order is in open state"
		when order_status = "CLOSED"
			then "Order is closed"
		when order_status = "CANCELLED"
			then "Order is cancelled"
	end
as full_order_status
from orders