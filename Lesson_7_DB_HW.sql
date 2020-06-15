/*Домашнее задание к уроку 7*/

/*Задача 1*/
use shop;
insert into orders 
	(user_id, created_at, updated_at)
	values 
	(2, NOW(), null),
	(3, NOW(), null),
	(6, NOW(), null);

select user_id from orders;


select * from users where id in (select user_id from orders);

/*Задача 2*/

select name, price, (select name from catalogs where id = catalog_id) as catalogs from products;