/*�������� ������� � ����� 7*/

/*������ 1*/
use shop;
insert into orders 
	(user_id, created_at, updated_at)
	values 
	(2, NOW(), null),
	(3, NOW(), null),
	(6, NOW(), null);

select user_id from orders;


select * from users where id in (select user_id from orders);

/*������ 2*/

select name, price, (select name from catalogs where id = catalog_id) as catalogs from products;

/* ������ 3*/

insert into cities 
	(label, name)
values 
	('moscow', '������'),
	('irkutsk', '�������'),
	('omsk', '����'),
	('kazan', '������'),
	('novgorod', '��������');



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
	


select id, (select name from cities where label = `from`) as '������', (select name from cities where label = `to`) as '����'  from flights;