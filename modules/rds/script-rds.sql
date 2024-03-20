USE EmployeeDB;

CREATE TABLE employees (
    id INT auto_increment PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    employee_email VARCHAR(100) NOT NULL,
    employee_password VARCHAR(15) NOT NULL,
    employee_registry INT(15) NOT NULL
);

SET character_set_client = utf8;
SET character_set_connection = utf8;
SET character_set_results = utf8;
SET collation_connection = utf8_general_ci;

INSERT INTO employees (employee_name, employee_email, employee_password, employee_registry) VALUES ('Gabriel de Barros Pontes', 'gabrielpontes98@gmail.com', '12345678', 123321);