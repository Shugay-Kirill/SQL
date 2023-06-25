create database hw1;
use hw1;
create table phone_catalog
(
id int primary key not null,
firm varchar(30) not null,
model varchar(30) not null,
price INT not null
);
INSERT INTO phone_catalog(id, firm, model, price)
VALUES 
(1, 'Samsung', "Galaxy S21 FE", 1200),
(2, "Samsung", "Galaxy A73", 1231),
(3, "Samsung", "Galaxy S34", 132),
(4, "Apple", "IPhone 11", 1455),
(5, "Apple", "IPhone 12", 4515),
(6, "Xiaomi", "11", 1111),
(7, "Xiaomi", "12", 1235);

Select * from phone_catalog;
SELECT firm, model, price FROM phone_catalog
where firm = "Samsung"