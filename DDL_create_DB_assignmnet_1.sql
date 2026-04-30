
CREATE DATABASE CollegeDB;

-- Use Database
USE CollegeDB;

-- =====================================
-- Create Table 1: Students
-- =====================================
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    age INT,
    department VARCHAR(50)
);

-- =====================================
-- Create Table 2: Courses
-- =====================================
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    duration_months INT
);

-- =====================================
-- Create Table 3: Enrollments
-- =====================================
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- =====================================
-- DDL Commands to Modify Tables
-- =====================================

-- 1. Add new column to Students table
ALTER TABLE Students
ADD email VARCHAR(100);

-- 2. Modify column datatype in Courses table
ALTER TABLE Courses
MODIFY course_name VARCHAR(100);

-- 3. Rename column in Students table
ALTER TABLE Students
CHANGE department dept_name VARCHAR(50);

-- 4. Drop column from Courses table
ALTER TABLE Courses
DROP COLUMN duration_months;

-- 5. Rename table Enrollments to Student_Enrollments
RENAME TABLE Enrollments TO Student_Enrollments;

-- =====================================
-- Show Tables
-- =====================================
SHOW TABLES;

-- Describe Tables
DESC Students;
DESC Courses;
DESC Student_Enrollments;