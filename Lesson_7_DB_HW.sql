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

/* Задача 3*/

insert into cities 
	(label, name)
values 
	('moscow', 'Москва'),
	('irkutsk', 'Иркутск'),
	('omsk', 'Омск'),
	('kazan', 'Казань'),
	('novgorod', 'Новгород');



drop table if exists flights;
create table flights (
	id serial primary key, 
	`from` varchar(255),
	`to` varchar(255),
	foreign key (`from`) references cities(label),
	foreign key (`to`) references cities(label)
	); 

insert into flights 
	(`from`, `to`)
values
	('moscow', 'omsk'),
	('novgorod', 'kazan'),
	('irkutsk', 'moscow'),
	('omsk', 'irkutsk'),
	('moscow', 'kazan');
	


select id, (select name from cities where label = `from`) as 'Откуда', (select name from cities where label = `to`) as 'Куда'  from flights;