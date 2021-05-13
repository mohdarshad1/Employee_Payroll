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