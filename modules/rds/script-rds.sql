USE EmployeeDB;

CREATE TABLE employees (
    id INT auto_increment PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    employee_email VARCHAR(100) NOT NULL,
    employee_password VARCHAR(100) NOT NULL,
    employee_registry INT NOT NULL
);

SET character_set_client = utf8;
SET character_set_connection = utf8;
SET character_set_results = utf8;
SET collation_connection = utf8_general_ci;

INSERT INTO employees (employee_name, employee_email, employee_password, employee_registry) VALUES ('Gabriel', 'gabrielpontes98@gmail.com', 'b72d891099b7e529d656f560b50a42cc0743c502058fb12ae1098f1a117e3be3', 111111);

INSERT INTO employees (employee_name, employee_email, employee_password, employee_registry) VALUES ('Eduardo', 'eduardopimenta9612@gmail.com', 'fe17110712ea56483b13907b8cb4ddd903fef89472a99af96ed195924fdf71a3', 111112);

INSERT INTO employees (employee_name, employee_email, employee_password, employee_registry) VALUES ('Sete', 'felipe.dioliveira@outlook.com', '41524dfd3ed080f326bc8be83bf9bd859e96880efb502a9e4f47898df188cb20', 111113);

INSERT INTO employees (employee_name, employee_email, employee_password, employee_registry) VALUES ('Fellipy', 'fellipy.saldanha@gmail.com', 'a816502e7a473c8db018e41dd787394f485589e9aeb998e84aaacd2b6af8e9bd', 111114);

INSERT INTO employees (employee_name, employee_email, employee_password, employee_registry) VALUES ('Fabiano', 'fabianorbr@gmail.com', '6c45f4ba81a49db3588bcf0a95d48d6fc471dd70d395c36f8f66250188fd5426', 111115);