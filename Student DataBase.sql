CREATE DATABASE STUDENT;

USE STUDENT;

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
Drop table students;
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    gender VARCHAR(100),
    email VARCHAR(100),
	password VARCHAR(100),
    phone_number VARCHAR(20),
    address VARCHAR(255),
    department_id INT,
	semester INT CHECK(semester>0 AND semester <9),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    course_credit INT,
    department_id INT,
	semester INT CHECK(semester>0 AND semester <9),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

Drop table enrollments;

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Fees (
    fee_id INT PRIMARY KEY,
    student_id INT,
	semester INT CHECK(semester>0 AND semester <9),
    amount DECIMAL(10, 2),
    payment_date DATE,
	due_date DATE,
	fee_status BIT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

CREATE TABLE Scholarships (
    scholarship_id INT PRIMARY KEY,
    student_id INT,
    scholarship_name VARCHAR(100),
    amount DECIMAL(10, 2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
	address VARCHAR(255),
	password VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Faculty_Course_Allocation (
    allocation_id INT PRIMARY KEY,
    faculty_id INT,
    course_id INT,
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
);




-- Departments
INSERT INTO Departments (department_id, department_name)
VALUES
(1, 'Software Engineering'),
(2, 'Electrical Engineering'),
(3, 'Mechanical Engineering');

-- Students
INSERT INTO Students (student_id, first_name, last_name, date_of_birth, gender, email, password, phone_number, address, department_id, semester)
VALUES
(1, 'Abdul', 'Rafeh', '2003-10-05', 'Male', 'rafeh@gmail.com', 'rafeh123', '123-456-7890', '123 Main St, Chowk Azam, USA', 1, 1),
(2, 'Mehboob', 'Alam', '2010-04-07', 'Male', 'mehboob@gmail.com', 'mehboob123', '456-789-0123', '456 Elm St, Gojra, Pakistan', 1, 2),
(3, 'Abdullah', 'Feroz', '2004-06-12', 'Female', 'abdullah@gmail.com', 'abdullah123', '789-012-3456', '789 Oak St, Lahore, Pakistan', 1, 3),
(4, 'Irtiza', 'Ali', '2004-12-23', 'Male', 'irtiza@gmail.com', 'irtiza123', '789-012-3456', '789 Okara St, Sahiwal, Pakistan', 1, 4),
(5, 'Asma', 'Jahangir', '2005-03-10', 'Female', 'asma@gmail.com', 'asma123', '789-012-3456', '789 Oak St, Karachi, Pakistan', 2, 3),
(6, 'Nawaz', 'Shareef', '2000-03-10', 'Other', 'nawaz@gmail.com', 'nawaz789', '789-012-3456', '789 Oak St, London, England', 3, 3);
-- Courses
-- Courses for Semester 1
INSERT INTO Courses (course_id, course_name, course_credit, department_id, semester)
VALUES
(1, 'Introduction to Programming', 3, 1, 1),
(2, 'Calculus I', 4, 1, 1),
(3, 'English Composition', 3, 1, 1),
(4, 'Introduction to Psychology', 3, 1, 1),
(5, 'History of Science', 3, 1, 1);

-- Courses for Semester 2
INSERT INTO Courses (course_id, course_name, course_credit, department_id, semester)
VALUES
(6, 'Data Structures and Algorithms', 4, 1, 2),
(7, 'Calculus II', 4, 1, 2),
(8, 'Introduction to Sociology', 3, 1, 2),
(9, 'Physics I', 4, 1, 2),
(10, 'Introduction to Ethics', 3, 1, 2);

-- Courses for Semester 3
INSERT INTO Courses (course_id, course_name, course_credit, department_id, semester)
VALUES
(11, 'Database Management Systems', 4, 1, 3),
(12, 'Discrete Mathematics', 3, 1, 3),
(13, 'Introduction to Linguistics', 3, 1, 3),
(14, 'Physics II', 4, 1, 3),
(15, 'Introduction to Anthropology', 3, 1, 3);

-- Courses for Semester 4
INSERT INTO Courses (course_id, course_name, course_credit, department_id, semester)
VALUES
(16, 'Software Engineering', 4, 1, 4),
(17, 'Linear Algebra', 3, 1, 4),
(18, 'Introduction to Political Science', 3, 1, 4),
(19, 'Operating Systems', 4, 1, 4),
(20, 'Introduction to Philosophy', 3, 1, 4);

-- Courses for Semester 5
INSERT INTO Courses (course_id, course_name, course_credit, department_id, semester)
VALUES
(21, 'Web Development', 4, 1, 5),
(22, 'Probability and Statistics', 3, 1, 5),
(23, 'Artificial Intelligence', 4, 1, 5),
(24, 'Computer Networks', 4, 1, 5),
(25, 'Modern Literature', 3, 1, 5);

-- Courses for Semester 1 (Electrical Engineering)
INSERT INTO Courses (course_id, course_name, course_credit, department_id, semester)
VALUES
(26, 'Circuit Theory', 4, 2, 1),
(27, 'Electromagnetic Fields', 4, 2, 1),
(28, 'Digital Electronics', 4, 2, 1),
(29, 'Introduction to Control Systems', 3, 2, 1),
(30, 'Engineering Mathematics', 3, 2, 1);

-- Courses for Semester 2 (Electrical Engineering)
INSERT INTO Courses (course_id, course_name, course_credit, department_id, semester)
VALUES
(31, 'Signals and Systems', 4, 2, 2),
(32, 'Power Electronics', 4, 2, 2),
(33, 'Electrical Machines', 4, 2, 2),
(34, 'Microcontrollers and Embedded Systems', 4, 2, 2),
(35, 'Engineering Ethics', 3, 2, 2);

-- Courses for Semester 3 (Electrical Engineering)
INSERT INTO Courses (course_id, course_name, course_credit, department_id, semester)
VALUES
(36, 'Renewable Energy Systems', 4, 2, 3),
(37, 'Digital Signal Processing', 4, 2, 3),
(38, 'High Voltage Engineering', 4, 2, 3),
(39, 'Communication Systems', 4, 2, 3),
(40, 'Engineering Economics', 3, 2, 3);

-- Courses for Semester 4 (Electrical Engineering)
INSERT INTO Courses (course_id, course_name, course_credit, department_id, semester)
VALUES
(41, 'Power System Analysis', 4, 2, 4),
(42, 'Renewable Energy Integration', 4, 2, 4),
(43, 'Electric Drives and Control', 4, 2, 4),
(44, 'Electrical Safety and Standards', 3, 2, 4),
(45, 'Project Management for Engineers', 3, 2, 4);

-- Courses for Semester 5 (Electrical Engineering)
INSERT INTO Courses (course_id, course_name, course_credit, department_id, semester)
VALUES
(46, 'Smart Grids', 4, 2, 5),
(47, 'Power System Protection', 4, 2, 5),
(48, 'Wireless Communication', 4, 2, 5),
(49, 'Optical Communication', 4, 2, 5),
(50, 'Technical Writing and Presentation Skills', 3, 2, 5);

-- Courses for Semester 1 (Mechanical Engineering)
INSERT INTO Courses (course_id, course_name, course_credit, department_id, semester)
VALUES
(51, 'Engineering Mechanics', 4, 3, 1),
(52, 'Mechanical Drawing', 4, 3, 1),
(53, 'Thermodynamics I', 4, 3, 1),
(54, 'Engineering Materials', 3, 3, 1),
(55, 'Introduction to Manufacturing Processes', 3, 3, 1);

-- Courses for Semester 2 (Mechanical Engineering)
INSERT INTO Courses (course_id, course_name, course_credit, department_id, semester)
VALUES
(56, 'Fluid Mechanics', 4, 3, 2),
(57, 'Strength of Materials', 4, 3, 2),
(58, 'Mechanical Vibrations', 4, 3, 2),
(59, 'Machine Design', 4, 3, 2),
(60, 'Engineering Economics', 3, 3, 2);

-- Courses for Semester 3 (Mechanical Engineering)
INSERT INTO Courses (course_id, course_name, course_credit, department_id, semester)
VALUES
(61, 'Heat Transfer', 4, 3, 3),
(62, 'Control Engineering', 4, 3, 3),
(63, 'Energy Conversion Systems', 4, 3, 3),
(64, 'Mechatronics', 4, 3, 3),
(65, 'Engineering Ethics', 3, 3, 3);

-- Courses for Semester 4 (Mechanical Engineering)
INSERT INTO Courses (course_id, course_name, course_credit, department_id, semester)
VALUES
(66, 'Finite Element Analysis', 4, 3, 4),
(67, 'Advanced Manufacturing Processes', 4, 3, 4),
(68, 'Robotics', 4, 3, 4),
(69, 'Automotive Engineering', 4, 3, 4),
(70, 'Engineering Project Management', 3, 3, 4);

-- Courses for Semester 5 (Mechanical Engineering)
INSERT INTO Courses (course_id, course_name, course_credit, department_id, semester)
VALUES
(71, 'Computational Fluid Dynamics', 4, 3, 5),
(72, 'Renewable Energy Technologies', 4, 3, 5),
(73, 'Aerospace Engineering', 4, 3, 5),
(74, 'Engineering Optimization', 4, 3, 5),
(75, 'Technical Communication', 3, 3, 5);

-- Enrollments
--INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
--VALUES
---(1, 1, 1, '2024-01-15'),
--(2, 2, 2, '2024-02-20'),
--(3, 3, 3, '2024-01-10');

-- Fees
Drop table fees;
INSERT INTO Fees (fee_id, student_id, semester, amount, payment_date, due_date, fee_status)
VALUES
(1, 1, 1, 500.00, '2024-01-20', '2024-01-30', 1),
(2, 2, 2, 600.00, '2024-02-25', '2024-03-05', 1),
(3, 3, 1, 450.00, '2024-01-15', '2024-01-25', 0);

-- Scholarships
Drop table scholarships;

INSERT INTO Scholarships (scholarship_id, student_id, scholarship_name, amount)
VALUES
(1, 1, 'Merit Scholarship', 200.00),
(2, 3, 'Need-based Scholarship', 150.00);

-- Faculty
--INSERT INTO Faculty (faculty_id, first_name, last_name, email, password, phone_number, address, department_id)
--VALUES
--(1, 'Michael', 'Johnson', 'michael.johnson@example.com', 'faculty123', '123-456-7890', '123 Main St, City, Country', 1),
--(2, 'Emily', 'Davis', 'emily.davis@example.com', 'faculty456', '456-789-0123', '456 Elm St, City, Country', 2);

-- Faculty for Computer Science Department
INSERT INTO Faculty (faculty_id, first_name, last_name, email, password, phone_number, address, department_id)
VALUES
(1, 'Muhammad', 'Khan', 'muhammad.khan@example.com', 'password1', '123-456-7890', '123 Main St, City, Country', 1),
(2, 'Fatima', 'Ali', 'fatima.ali@example.com', 'password2', '234-567-8901', '234 Elm St, City, Country', 1),
(3, 'Ahmed', 'Ahmed', 'ahmed.ahmed@example.com', 'password3', '345-678-9012', '345 Oak St, City, Country', 1),
(4, 'Ayesha', 'Siddiqui', 'ayesha.siddiqui@example.com', 'password4', '456-789-0123', '456 Maple St, City, Country', 1),
(5, 'Ali', 'Raza', 'ali.raza@example.com', 'password5', '567-890-1234', '567 Pine St, City, Country', 1);

-- Faculty for Electrical Engineering Department
INSERT INTO Faculty (faculty_id, first_name, last_name, email, password, phone_number, address, department_id)
VALUES
(6, 'Aisha', 'Khan', 'aisha.khan@example.com', 'password6', '678-901-2345', '678 Cedar St, City, Country', 2),
(7, 'Mohammad', 'Ahmed', 'mohammad.ahmed@example.com', 'password7', '789-012-3456', '789 Birch St, City, Country', 2),
(8, 'Sana', 'Malik', 'sana.malik@example.com', 'password8', '890-123-4567', '890 Walnut St, City, Country', 2),
(9, 'Bilal', 'Hussain', 'bilal.hussain@example.com', 'password9', '901-234-5678', '901 Elm St, City, Country', 2),
(10, 'Amina', 'Iqbal', 'amina.iqbal@example.com', 'password10', '012-345-6789', '012 Oak St, City, Country', 2);
-- Faculty for Mechanical Engineering Department
INSERT INTO Faculty (faculty_id, first_name, last_name, email, password, phone_number, address, department_id)
VALUES
(11, 'Muhammad', 'Ahmed', 'muhammad.ahmed@example.com', 'password11', '123-456-7890', '123 Main St, City, Country', 3),
(12, 'Ayesha', 'Khan', 'ayesha.khan@example.com', 'password12', '234-567-8901', '234 Elm St, City, Country', 3),
(13, 'Ali', 'Hussain', 'ali.hussain@example.com', 'password13', '345-678-9012', '345 Oak St, City, Country', 3),
(14, 'Fatima', 'Malik', 'fatima.malik@example.com', 'password14', '456-789-0123', '456 Maple St, City, Country', 3),
(15, 'Ahmed', 'Siddiqui', 'ahmed.siddiqui@example.com', 'password15', '567-890-1234', '567 Pine St, City, Country', 3);

-- Faculty_Course_Allocation
INSERT INTO Faculty_Course_Allocation (allocation_id, faculty_id, course_id)
VALUES
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5),
(6,1,6),
(7,2,7),
(8,3,8),
(9,4,9),
(10,5,10),
(11,1,11),
(12,2,12),
(13,3,13),
(14,4,14),
(15,5,15),
(16,1,16),
(17,2,17),
(18,3,18),
(19,4,19),
(20,5,20),
(21,1,21),
(22,2,22),
(23,3,23),
(24,4,24),
(25,5,25),
(26,6,26),
(27,7,27),
(28,8,28),
(29,9,29),
(30,10,30),
(31,6,31),
(32,7,32),
(33,8,33),
(34,9,34),
(35,10,35),
(36,6,36),
(37,7,37),
(38,8,38),
(39,9,39),
(40,10,40),
(41,6,41),
(42,7,42),
(43,8,43),
(44,9,44),
(45,10,45),
(46,6,46),
(47,7,47),
(48,8,48),
(49,9,49),
(50,10,50),
(51,11,51),
(52,12,52),
(53,13,53),
(54,14,54),
(55,15,55),
(56,11,56),
(57,12,57),
(58,13,58),
(59,14,59),
(60,15,60),
(61,11,61),
(62,12,62),
(63,13,63),
(64,14,64),
(65,15,65),
(66,11,66),
(67,12,67),
(68,13,68),
(69,14,69),
(70,15,70),
(71,11,71),
(72,12,72),
(73,13,73),
(74,14,74),
(75,15,75);



SELECT F.first_name,F.last_name,C.course_name,C.course_id,C.department_id,C.semester FROM Courses C , faculty F , faculty_course_allocation FCA 
WHERE FCA.course_id=C.course_id AND FCA.faculty_id=F.faculty_id;