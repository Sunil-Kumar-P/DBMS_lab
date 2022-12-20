

Order database

create table Salesman(
    -> sid int(6),
    -> name varchar(25),
    -> city varchar(30),
    -> commission int(7),
    -> primary key(sid)
    -> );

desc Salesman;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| sid        | int(6)      | NO   | PRI | NULL    |       |
| name       | varchar(25) | YES  |     | NULL    |       |
| city       | varchar(30) | YES  |     | NULL    |       |
| commission | int(7)      | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
4 rows in set (0.036 sec)


create table Customer (
	cust_id int(6),
	cust_name varchar(30),
	c_city varchar(30),
	grade int(6),
	sid int(6),
	primary key(cust_id),
	foreign key(sid) references Salesman(sid) on delete set null
);

desc Customer;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| cust_id   | int(6)      | NO   | PRI | NULL    |       |
| cust_name | varchar(30) | YES  |     | NULL    |       |
| c_city    | varchar(30) | YES  |     | NULL    |       |
| grade     | int(6)      | YES  |     | NULL    |       |
| sid       | int(6)      | YES  | MUL | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
5 rows in set (0.001 sec)


create table Order (
	ord_no int(6),
	purchase_amt int(7),
	ord_date date,
	cus_id int(6),
	sid int(6),
	primary key(ord_no),
	foreign key(cus_id) references Customer(cust_id) on delete cascade,
	foreign key(sid) references Salesman(sid) on delete cascade
);
desc Order1;
+--------------+--------+------+-----+---------+-------+
| Field        | Type   | Null | Key | Default | Extra |
+--------------+--------+------+-----+---------+-------+
| ord_no       | int(6) | NO   | PRI | NULL    |       |
| purchase_amt | int(7) | YES  |     | NULL    |       |
| ord_date     | date   | YES  |     | NULL    |       |
| cus_id       | int(6) | YES  | MUL | NULL    |       |
| sid          | int(6) | YES  | MUL | NULL    |       |
+--------------+--------+------+-----+---------+-------+
5 rows in set (0.002 sec)

inserting values

insert into Salesman values(1000, 'PAVAN S', 'banglore', 2000);
insert into Salesman values(1001, 'MANOJ S', 'mysuru', 5000);
insert into Salesman values(1002, 'PRABHAKAR G', 'bengluru', 1000);
insert into Salesman values(1003, 'PRAJWAL', 'Mandya', 500);
insert into Salesman values(1004, 'PRAVEEN', 'Singapore', 9000);
insert into Salesman values(1005, 'Jeevan', 'banglore', 1200);

select * from Salesman;
Query OK, 1 row affected (0.077 sec)

+------+-------------+-----------+------------+
| sid  | name        | city      | commission |
+------+-------------+-----------+------------+
| 1000 | PAVAN S     | banglore  |       2000 |
| 1001 | MANOJ S     | mysuru    |       5000 |
| 1002 | PRABHAKAR G | bengluru  |       1000 |
| 1003 | PRAJWAL     | Mandya    |        500 |
| 1004 | PRAVEEN     | Singapore |       9000 |
| 1005 | Jeevan      | banglore  |       1200 |
+------+-------------+-----------+------------+
6 rows in set (0.000 sec)



insert into Customer values(100, 'Sunil Kumar P', 'Banglore', 100, 1000);
insert into Customer values(101, 'Prabakhar', 'Mysore', 90, 1004);
insert into Customer values(102, 'Himansu', 'Mandya', 80, 1001);
insert into Customer values(103, 'Hari', 'Tirupathi', 80, 1002);
insert into Customer values(104, 'Nayan', 'Kolar', 60, 1002);
insert into Customer values(105, 'Ganesh Kumar P', 'gadaga', 40, 1003);
insert into Customer values(106, 'Madhakari', 'Banglore', 10, 1000);

select * from Customer;
+---------+----------------+-----------+-------+------+
| cust_id | cust_name      | c_city    | grade | sid  |
+---------+----------------+-----------+-------+------+
|     100 | Sunil Kumar P  | Banglore  |   100 | 1000 |
|     101 | Prabakhar      | Mysore    |    90 | 1004 |
|     102 | Himansu        | Mandya    |    80 | 1001 |
|     103 | Hari           | Tirupathi |    80 | 1002 |
|     104 | Nayan          | Kolar     |    60 | 1002 |
|     105 | Ganesh Kumar P | gadaga    |    40 | 1003 |
|     106 | Madhakari      | Banglore  |    10 | 1000 |
+---------+----------------+-----------+-------+------+


Query 1

select count(*) from Customer 
where grade > ( select avg(grade) from Customer 
where c_city = 'Banglore');

+----------+
| count(*) |
+----------+
|        5 |
+----------+
1 row in set (0.035 sec)

Query 2

select S.sid, S.name from Salesman S, Customer C
where S.sid = C.sid group by S.sid, S.name
having count(*) > 1;



