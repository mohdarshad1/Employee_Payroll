#Welcome to Employee Payroll

#UC1

mysql> create database payroll_service;

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| payroll_service    |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+

mysql> use payroll_service
Database changed

mysql> select database();
+-----------------+
| database()      |
+-----------------+
| payroll_service |
+-----------------+

#UC2

mysql> CREATE TABLE employee_payroll
    -> (
    -> id INT unsigned NOT NULL AUTO_INCREMENT,
    -> name VARCHAR(150) NOT NULL,
    -> salary DOUBLE NOT NULL,
    -> start DATE NOT NULL,
    -> PRIMARY KEY(id)
    -> );

mysql> describe employee_payroll;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int unsigned | NO   | PRI | NULL    | auto_increment |
| name   | varchar(150) | NO   |     | NULL    |                |
| salary | double       | NO   |     | NULL    |                |
| start  | date         | NO   |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+

#UC3

mysql> INSERT into employee_payroll(name,salary,start)
    -> values("Rick",100000,'2020-10-20'),
    -> ('Harry',150000,'2018-12-15'),
    -> ('David',200000,'2017-01-01');

#UC4

mysql> select * from employee_payroll;
+----+-------+--------+------------+
| id | name  | salary | start      |
+----+-------+--------+------------+
|  1 | Rick  | 100000 | 2020-10-20 |
|  2 | Harry | 150000 | 2018-12-15 |
|  3 | David | 200000 | 2017-01-01 |
+----+-------+--------+------------+

#UC5

mysql> SELECT salary FROM employee_payroll
    -> WHERE name = 'Rick';
+--------+
| salary |
+--------+
| 100000 |
+--------+

mysql> select * from employee_payroll
    -> WHERE start BETWEEN CAST('2018-01-01' AS DATE)
    -> AND DATE(NOW());
+----+-------+--------+------------+
| id | name  | salary | start      |
+----+-------+--------+------------+
|  1 | Rick  | 100000 | 2020-10-20 |
|  2 | Harry | 150000 | 2018-12-15 |
+----+-------+--------+------------+

#UC6

mysql> ALTER TABLE employee_payroll
    -> ADD gender varchar(1) NOT NULL AFTER name;

mysql> select * from employee_payroll;
+----+-------+--------+--------+------------+
| id | name  | gender | salary | start      |
+----+-------+--------+--------+------------+
|  1 | Rick  |        | 100000 | 2020-10-20 |
|  2 | Harry |        | 150000 | 2018-12-15 |
|  3 | David |        | 200000 | 2017-01-01 |
+----+-------+--------+--------+------------+

mysql> UPDATE employee_payroll
    -> SET gender = 'M'
    -> WHERE name = 'Rick' OR
    -> name = 'Harry' OR
    -> name = 'David'

mysql> select * from employee_payroll;
+----+-------+--------+--------+------------+
| id | name  | gender | salary | start      |
+----+-------+--------+--------+------------+
|  1 | Rick  | M      | 100000 | 2020-10-20 |
|  2 | Harry | M      | 150000 | 2018-12-15 |
|  3 | David | M      | 200000 | 2017-01-01 |
+----+-------+--------+--------+------------+

#UC7

mysql> INSERT into employee_payroll(name,gender,salary,start) VALUES
    -> ("Natalie",'F',175000,'2020-06-18'),
    -> ('Marie','F',225000,'2019-09-27');

mysql> select * from employee_payroll;
+----+---------+--------+--------+------------+
| id | name    | gender | salary | start      |
+----+---------+--------+--------+------------+
|  1 | Rick    | M      | 100000 | 2020-10-20 |
|  2 | Harry   | M      | 150000 | 2018-12-15 |
|  3 | David   | M      | 200000 | 2017-01-01 |
|  4 | Natalie | F      | 175000 | 2020-06-18 |
|  5 | Marie   | F      | 225000 | 2019-09-27 |
+----+---------+--------+--------+------------+

mysql> SELECT SUM(salary) FROM employee_payroll
    -> WHERE gender = 'M'
    -> GROUP BY gender;
+-------------+
| SUM(salary) |
+-------------+
|      450000 |
+-------------+

mysql> SELECT SUM(salary) FROM employee_payroll
    -> WHERE gender = 'F'
    -> GROUP BY gender;
+-------------+
| SUM(salary) |
+-------------+
|      400000 |
+-------------+

mysql> SELECT AVG(salary) FROM employee_payroll
    -> WHERE gender = 'M'
    -> GROUP BY gender;
+-------------+
| AVG(salary) |
+-------------+
|      150000 |
+-------------+

mysql> SELECT AVG(salary) FROM employee_payroll
    -> WHERE gender = 'F'
    -> GROUP BY gender;
+-------------+
| AVG(salary) |
+-------------+
|      200000 |
+-------------+

mysql> SELECT MIN(salary) FROM employee_payroll
    -> WHERE gender = 'M'
    -> GROUP BY gender;
+-------------+
| MIN(salary) |
+-------------+
|      100000 |
+-------------+

mysql> SELECT MIN(salary) FROM employee_payroll
    -> WHERE gender = 'F'
    -> GROUP BY gender;
+-------------+
| MIN(salary) |
+-------------+
|      175000 |
+-------------+

mysql> SELECT MAX(salary) FROM employee_payroll
    -> WHERE gender = 'M'
    -> GROUP BY gender;
+-------------+
| MAX(salary) |
+-------------+
|      200000 |
+-------------+

mysql> SELECT MAX(salary) FROM employee_payroll
    -> WHERE gender = 'F'
    -> GROUP BY gender;
+-------------+
| MAX(salary) |
+-------------+
|      225000 |
+-------------+

mysql> SELECT COUNT(*) FROM employee_payroll
    -> WHERE gender = 'M';
+----------+
| COUNT(*) |
+----------+
|        3 |
+----------+

mysql> SELECT COUNT(*) FROM employee_payroll
    -> WHERE gender = 'F';
+----------+
| COUNT(*) |
+----------+
|        2 |
+----------+

#UC8

mysql> ALTER TABLE employee_payroll
    -> ADD phone_number BIGINT unsigned AFTER name;

mysql> ALTER TABLE employee_payroll
    -> ADD emp_department VARCHAR(150) NOT NULL AFTER phone_number;

mysql> ALTER TABLE employee_payroll
    -> ADD address VARCHAR(150) AFTER emp_department;

mysql> AFTER TABLE employee_payroll ALTER address DEFAULT 'TBD';

mysql> DESC employee_payroll;
+----------------+-----------------+------+-----+---------+----------------+
| Field          | Type            | Null | Key | Default | Extra          |
+----------------+-----------------+------+-----+---------+----------------+
| id             | int unsigned    | NO   | PRI | NULL    | auto_increment |
| name           | varchar(150)    | NO   |     | NULL    |                |
| phone_number   | bigint unsigned | YES  |     | NULL    |                |
| emp_department | varchar(150)    | NO   |     | NULL    |                |
| address        | varchar(150)    | YES  |     | TBD     |                |
| gender         | varchar(1)      | NO   |     | NULL    |                |
| salary         | double          | NO   |     | NULL    |                |
| start          | date            | NO   |     | NULL    |                |
+----------------+-----------------+------+-----+---------+----------------+

#UC9

mysql> ALTER TABLE employee_payroll RENAME COLUMN salary TO basic_pay;
mysql> ALTER TABLE employee_payroll ADD deductions DOUBLE NOT NULL AFTER basic_pay;
mysql> ALTER TABLE employee_payroll ADD taxable_pay DOUBLE NOT NULL AFTER deductions;
mysql> ALTER TABLE employee_payroll ADD tax DOUBLE NOT NULL AFTER taxable_pay;
mysql> ALTER TABLE employee_payroll ADD net_pay DOUBLE NOT NULL AFTER tax;

mysql> desc employee_payroll;
+----------------+-----------------+------+-----+---------+----------------+
| Field          | Type            | Null | Key | Default | Extra          |
+----------------+-----------------+------+-----+---------+----------------+
| id             | int unsigned    | NO   | PRI | NULL    | auto_increment |
| name           | varchar(150)    | NO   |     | NULL    |                |
| phone_number   | bigint unsigned | YES  |     | NULL    |                |
| emp_department | varchar(150)    | NO   |     | NULL    |                |
| address        | varchar(150)    | YES  |     | TBD     |                |
| gender         | varchar(1)      | NO   |     | NULL    |                |
| basic_pay      | double          | NO   |     | NULL    |                |
| deductions     | double          | NO   |     | NULL    |                |
| taxable_pay    | double          | NO   |     | NULL    |                |
| tax            | double          | NO   |     | NULL    |                |
| net_pay        | double          | NO   |     | NULL    |                |
| start          | date            | NO   |     | NULL    |                |
+----------------+-----------------+------+-----+---------+----------------+

#UC11

mysql> USE payroll_service;

mysql> CREATE TABLE company(
-> company_id INT NOT NULL,
-> company_name VARCHAR(30) NOT NULL,
-> PRIMARY KEY(company_id));

mysql> INSERT INTO company VALUES(1,'Facebook'),(2,'Google'),(3,'Apple');

mysql> CREATE TABLE department(
-> dept_id INT NOT NULL,
-> dept_name VARCHAR(50) NOT NULL,
-> PRIMARY KEY(dept_id));

mysql> INSERT INTO department VALUES (101,'Sales'),(102,'Marketing'),(103,'Logistics'),(104,'Management');

mysql> CREATE TABLE employee(
-> id INT NOT NULL,
-> company_id INT NOT NULL,
-> employee_name VARCHAR(30) NOT NULL,
-> phone_number VARCHAR(30) NOT NULL,
-> address VARCHAR(150) NOT NULL DEFAULT 'TBD',
-> gender VARCHAR(1) NOT NULL,
-> PRIMARY KEY(id),
-> CONSTRAINT FK FOREIGN KEY(company_id) REFERENCES company(company_id));

mysql> INSERT INTO employee VALUES (101,1,'Bill','9876543210','California','M'),(102,1,'Terisa','8876543211','San Francisco','F'),(103,2,'Charlie','7876543212','New York','M');

mysql> CREATE TABLE employee_department(
  -> emp_id INT NOT NULL,
  -> dept_id INT NOT NULL,
  -> PRIMARY KEY (emp_id,dept_id),
  -> FOREIGN KEY (dept_id) REFERENCES department (dept_id),
  -> FOREIGN KEY (emp_id) REFERENCES employee (id),
  -> FOREIGN KEY (dept_id) REFERENCES department (dept_id)
);

mysql> INSERT INTO employee_department VALUES (101,203),(102,201),(102,202),(103,204);


-> CREATE TABLE payroll (
-> emp_id INT DEFAULT NULL,
-> basic_pay DOUBLE NOT NULL,
-> deductions DOUBLE NOT NULL,
-> taxable_pay DOUBLE NOT NULL,
-> tax DOUBLE NOT NULL,
-> net_pay DOUBLE NOT NULL
);


mysql> INSERT INTO payroll VALUES (101,50000,5000,45000,5000,40000),(102,20000,2000,18000,3000,15000),(103,60000,6000,54000,4000,50000);

#UC12

mysql> select * from company;
+------------+--------------+
| company_id | company_name |
+------------+--------------+
|          1 | Capgemini    |
|          2 | Company B    |
|          3 | Company C    |
+------------+--------------+

mysql> INSERT INTO employee VALUES (101,1,'Bill','9876543210','California','M'),(102,1,'Terisa','8876543211','San Francisco','F'),(103,2,'Charlie','7876543212','New York','M');

mysql> SELECT * FROM employee;
+-----+------------+---------------+--------------+---------------+--------+
| id  | company_id | employee_name | phone_number | address       | gender |
+-----+------------+---------------+--------------+---------------+--------+
| 101 |          1 | Bill          | 9876543210   | California    | M      |
| 102 |          1 | Terisa        | 8876543211   | San Francisco | F      |
| 103 |          2 | Charlie       | 7876543212   | New York      | M      |
+-----+------------+---------------+--------------+---------------+--------+

mysql> INSERT INTO department VALUES (101,'Sales'),(102,'Marketing'),(103,'Logistics'),(104,'Management');

mysql> select * from department;
+---------+------------+
| dept_id | dept_name  |
+---------+------------+
|     201 | Sales      |
|     202 | Marketing  |
|     203 | Logistics  |
|     204 | Management |
+---------+------------+

mysql> INSERT INTO employee_department VALUES (101,203),(102,201),(102,202),(103,204);

mysql> Select * from employee_department;
+--------+---------+
| emp_id | dept_id |
+--------+---------+
|    101 |     203 |
|    102 |     201 |
|    102 |     202 |
|    103 |     204 |
+--------+---------+

mysql> INSERT INTO payroll VALUES (101,50000,5000,45000,5000,40000),(102,20000,2000,18000,3000,15000),(103,60000,6000,54000,4000,50000);

mysql> select * from payroll;
+--------+-----------+------------+-------------+------+---------+
| emp_id | basic_pay | deductions | taxable_pay | TAX  | NET_PAY |
+--------+-----------+------------+-------------+------+---------+
|    101 |     50000 |       5000 |       45000 | 5000 |   40000 |
|    102 |     20000 |       2000 |       18000 | 3000 |   15000 |
|    103 |     60000 |       6000 |       54000 | 4000 |   50000 |
+--------+-----------+------------+-------------+------+---------+

SELECT gender,COUNT(id) FROM employee 			
GROUP BY gender;
+--------+-----------+
| gender | COUNT(id) |
+--------+-----------+
| M      |         2 |
| F      |         1 |
+--------+-----------+

SELECT net_pay FROM PAYROLL WHERE emp_id =(SELECT id FROM employee where gender = 'F');
+---------+
| net_pay |
+---------+
|   15000 |
+---------+

SELECT SUM(p.net_pay) FROM employee e left join payroll p on  p.emp_id = e.id GROUP BY e.gender;
+----------------+
| SUM(p.net_pay) |
+----------------+
|          90000 |
|          15000 |
+----------------+

SELECT AVG(p.net_pay) FROM employee e left join payroll p on  p.emp_id = e.id GROUP BY e.gender;
+----------------+
| AVG(p.net_pay) |
+----------------+
|          45000 |
|          15000 |
+----------------+

SELECT MAX(p.net_pay) FROM employee e left join payroll p on  p.emp_id = e.id GROUP BY e.gender;
+----------------+
| MAX(p.net_pay) |
+----------------+
|          50000 |
|          15000 |
+----------------+

SELECT MIN(p.net_pay) FROM employee e left join payroll p on  p.emp_id = e.id GROUP BY e.gender;
+----------------+
| MIN(p.net_pay) |
+----------------+
|          40000 |
|          15000 |
+----------------+