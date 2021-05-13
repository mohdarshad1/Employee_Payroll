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