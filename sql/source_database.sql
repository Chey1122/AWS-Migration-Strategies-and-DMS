
CREATE DATABASE IF NOT EXISTS migration_project;

USE migration_project;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    department VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO students VALUES
(101, 'Rahul', 'CSE', 'rahul@example.com'),
(102, 'Priya', 'ECE', 'priya@example.com'),
(103, 'Arjun', 'IT', 'arjun@example.com'),
(104, 'Sneha', 'CSE', 'sneha@example.com'),
(105, 'Kiran', 'EEE', 'kiran@example.com');

SELECT * FROM students;
