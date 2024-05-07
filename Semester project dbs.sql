create database Final_Project_DBS;
Use Final_Project_DBS;

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

create table Department_Course_Allocation(
allocation_id int primary key,
department_id int ,
course_id int,
semester int check (semester>0 and semester <9),
foreign key(department_id) references Departments(department_id),
foreign key(course_id) references Courses(course_id));

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
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
	semester INT CHECK(semester>0 AND semester <9)
);




CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
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
	due_date DATE
	);

	create table Fees_Payment(
	payment_id int primary key,
	fee_id int,
	student_id int,
	status bit,
	foreign key(fee_id) references Fees(fee_id),
	foreign key(student_id) references Students(student_id)
	);

CREATE TABLE Scholarships (
    scholarship_id INT PRIMARY KEY,
    student_id INT,
    scholarship_name VARCHAR(100),
    amount DECIMAL(10, 2),
);


CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
	address VARCHAR(255),
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

create table Grades(
grade_id int primary key,
student_id int ,
course_id int,
grade char(2)
foreign key(student_id) references Students(student_id),
foreign key(course_id) references Courses(course_id)
);

select * from Faculty;

select * from Scholarships;
select * from Faculty_Course_Allocation;


--================================================data entry queries======================================================


--student table
INSERT INTO Students (student_id, first_name, last_name, date_of_birth, gender, email, password, phone_number, address, department_id, semester)
VALUES
(1, 'Abdul', 'Rafeh', '2003-10-05', 'Male', 'rafeh@gmail.com', 'rafeh123', '123-456-7890', '123 Main St, Chowk Azam, Pakistan', 1, 1),
(2, 'Mehboob', 'Alam', '2010-04-07', 'Male', 'mehboob@gmail.com', 'mehboob123', '456-789-0123', '456 Elm St, Gojra, Pakistan', 1, 2),
(3, 'Abdullah', 'Feroz', '2004-06-12', 'Female', 'abdullah@gmail.com', 'abdullah123', '789-012-3456', '789 Oak St, Lahore, Pakistan', 1, 3),
(4, 'Irtiza', 'Ali', '2004-12-23', 'Male', 'irtiza@gmail.com', 'irtiza123', '789-012-3456', '789 Okara St, Sahiwal, Pakistan', 1, 4),
(5, 'Asma', 'Jahangir', '2005-03-10', 'Female', 'asma@gmail.com', 'asma123', '789-012-3456', '789 Oak St, Karachi, Pakistan', 2, 3),
(6, 'Nawaz', 'Shareef', '2000-03-10', 'Other', 'nawaz@gmail.com', 'nawaz789', '789-012-3456', '789 Oak St, London, England', 3, 3),
(7, 'Ali', 'Khan', '2002-08-15', 'Male', 'ali@gmail.com', 'ali456', '321-654-0987', '789 Pine St, Islamabad, Pakistan', 1, 1),
(8, 'Farah', 'Siddiqui', '2001-11-25', 'Female', 'farah@gmail.com', 'farah789', '987-654-3210', '456 Maple St, Karachi, Pakistan', 2, 2),
(9, 'Hassan', 'Rafiq', '2003-03-18', 'Male', 'hassan@gmail.com', 'hassan123', '123-987-6543', '321 Birch St, Lahore, Pakistan', 3, 3),
(10, 'Mariam', 'Akhtar', '2002-05-30', 'Female', 'mariam@gmail.com', 'mariam456', '543-210-9876', '789 Oak St, Peshawar, Pakistan', 4, 4),
(11, 'Saad', 'Mirza', '2004-07-15', 'Male', 'saad@gmail.com', 'saad789', '789-345-6789', '789 Cedar St, Rawalpindi, Pakistan', 5, 5),
(12, 'Zara', 'Khalid', '2003-10-10', 'Female', 'zara@gmail.com', 'zara123', '123-654-9870', '456 Willow St, Multan, Pakistan', 1, 6),
(13, 'Tariq', 'Naseer', '2002-12-20', 'Male', 'tariq@gmail.com', 'tariq456', '321-987-6543', '321 Oak St, Gujranwala, Pakistan', 2, 7),
(14, 'Sara', 'Riaz', '2005-04-05', 'Female', 'sara@gmail.com', 'sara789', '789-012-3457', '789 Cherry St, Faisalabad, Pakistan', 3, 8),
(15, 'Waqas', 'Hussain', '2001-08-08', 'Male', 'waqas@gmail.com', 'waqas123', '123-345-6789', '123 Sycamore St, Abbottabad, Pakistan', 4, 1),
(16, 'Sana', 'Iqbal', '2000-09-15', 'Female', 'sana@gmail.com', 'sana456', '987-654-3210', '456 Pine St, Quetta, Pakistan', 5, 2),
(17, 'Khalid', 'Ahmed', '2003-11-12', 'Male', 'khalid@gmail.com', 'khalid789', '789-012-3458', '123 Cedar St, Karachi, Pakistan', 1, 3),
(18, 'Ayesha', 'Sultan', '2004-02-17', 'Female', 'ayesha@gmail.com', 'ayesha123', '123-456-7891', '456 Elm St, Islamabad, Pakistan', 2, 4),
(19, 'Bilal', 'Naeem', '2003-06-23', 'Male', 'bilal@gmail.com', 'bilal456', '987-654-3211', '789 Ash St, Multan, Pakistan', 3, 5),
(20, 'Hina', 'Rashid', '2001-01-05', 'Female', 'hina@gmail.com', 'hina789', '789-012-3459', '321 Oak St, Faisalabad, Pakistan', 4, 6),
(21, 'Usman', 'Shahid', '2002-07-15', 'Male', 'usman@gmail.com', 'usman123', '123-456-7892', '789 Cherry St, Lahore, Pakistan', 5, 7),
(22, 'Nadia', 'Khan', '2003-09-27', 'Female', 'nadia@gmail.com', 'nadia456', '987-654-3212', '456 Willow St, Karachi, Pakistan', 1, 8),
(23, 'Omar', 'Irfan', '2004-10-10', 'Male', 'omar@gmail.com', 'omar789', '789-012-3450', '123 Birch St, Islamabad, Pakistan', 2, 1),
(24, 'Amina', 'Ahmad', '2005-03-20', 'Female', 'amina@gmail.com', 'amina123', '123-456-7893', '321 Pine St, Quetta, Pakistan', 3, 2),
(25, 'Nabeel', 'Anwar', '2002-04-07', 'Male', 'nabeel@gmail.com', 'nabeel456', '987-654-3213', '789 Oak St, Faisalabad, Pakistan', 4, 3),
(26, 'Iqra', 'Bibi', '2001-12-03', 'Female', 'iqra@gmail.com', 'iqra789', '123-345-6780', '456 Maple St, Lahore, Pakistan', 5, 4),
(27, 'Arsalan', 'Yousuf', '2003-06-25', 'Male', 'arsalan@gmail.com', 'arsalan123', '123-987-6540', '123 Oak St, Islamabad, Pakistan', 1, 5),
(28, 'Nazish', 'Parveen', '2004-08-15', 'Female', 'nazish@gmail.com', 'nazish456', '456-987-1234', '456 Oak St, Multan, Pakistan', 2, 6),
(29, 'Adnan', 'Khan', '2002-09-05', 'Male', 'adnan@gmail.com', 'adnan789', '789-345-6780', '321 Pine St, Faisalabad, Pakistan', 3, 7),
(30, 'Zainab', 'Ali', '2003-12-05', 'Female', 'zainab@gmail.com', 'zainab123', '456-123-9876', '789 Willow St, Karachi, Pakistan', 4, 8);


--courses data
INSERT INTO Courses (course_id, course_name, course_credit)
VALUES
-- Department 1: Computer Science and Engineering
(1, 'Introduction to Programming', 3),
(2, 'Data Structures', 3),
(3, 'Algorithms', 3),
(4, 'Computer Networks', 3),
(5, 'Database Systems', 3),
(6, 'Operating Systems', 3),
(7, 'Software Engineering', 3),
(8, 'Artificial Intelligence', 3),

-- Department 2: Electrical and Electronics Engineering
(9, 'Circuit Analysis', 3),
(10, 'Digital Electronics', 3),
(11, 'Electromagnetic Theory', 3),
(12, 'Control Systems', 3),
(13, 'Power Systems', 3),
(14, 'Signals and Systems', 3),
(15, 'Microprocessors and Microcontrollers', 3),
(16, 'Communication Systems', 3),

-- Department 3: Mechanical Engineering
(17, 'Thermodynamics', 3),
(18, 'Fluid Mechanics', 3),
(19, 'Mechanics of Materials', 3),
(20, 'Machine Design', 3),
(21, 'Heat Transfer', 3),
(22, 'Manufacturing Processes', 3),
(23, 'Dynamics', 3),
(24, 'Control Systems', 3),

-- Department 4: Civil Engineering
(25, 'Engineering Mechanics', 3),
(26, 'Structural Analysis', 3),
(27, 'Geotechnical Engineering', 3),
(28, 'Transportation Engineering', 3),
(29, 'Environmental Engineering', 3),
(30, 'Construction Management', 3),
(31, 'Hydraulics', 3),
(32, 'Surveying', 3),

-- Department 5: Chemical Engineering
(33, 'Chemical Process Calculations', 3),
(34, 'Heat Transfer', 3),
(35, 'Mass Transfer', 3),
(36, 'Chemical Reaction Engineering', 3),
(37, 'Process Control', 3),
(38, 'Chemical Process Industries', 3),
(39, 'Plant Design', 3),
(40, 'Polymer Engineering', 3);

INSERT INTO Courses (course_id, course_name, course_credit)
VALUES
-- Basic and art subjects for all departments
(41, 'Calculus I', 3),
(42, 'Calculus II', 3),
(43, 'Linear Algebra', 3),
(44, 'General Physics I', 3),
(45, 'General Physics II', 3),
(46, 'General Chemistry', 3),
(47, 'English Communication Skills', 3),
(48, 'Technical Writing', 3),
(49, 'Ethics and Professional Practice', 3),
(50, 'Economics', 3),
(51, 'Introduction to Sociology', 3),
(52, 'Introduction to Psychology', 3),
(53, 'Humanities', 3),
(54, 'Environmental Science', 3);



-- Allocation data for Department 1
INSERT INTO Department_Course_Allocation (allocation_id, department_id, course_id, semester)
VALUES
-- Semester 1 for Department 1
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 1, 3, 1),
(4, 1, 4, 1),
(5, 1, 41, 1), -- Basic or Art course

-- Semester 2 for Department 1
(6, 1, 5, 2),
(7, 1, 6, 2),
(8, 1, 7, 2),
(9, 1, 8, 2),
(10, 1, 42, 2), -- Basic or Art course

-- Semester 3 for Department 1
(11, 1, 3, 3),
(12, 1, 4, 3),
(13, 1, 5, 3),
(14, 1, 6, 3),
(15, 1, 43, 3), -- Basic or Art course

-- Semester 4 for Department 1
(16, 1, 7, 4),
(17, 1, 8, 4),
(18, 1, 1, 4),
(19, 1, 2, 4),
(20, 1, 44, 4), -- Basic or Art course

-- Semester 5 for Department 1
(21, 1, 4, 5),
(22, 1, 5, 5),
(23, 1, 6, 5),
(24, 1, 7, 5),
(25, 1, 45, 5), -- Basic or Art course

-- Semester 6 for Department 1
(26, 1, 3, 6),
(27, 1, 4, 6),
(28, 1, 5, 6),
(29, 1, 6, 6),
(30, 1, 46, 6), -- Basic or Art course

-- Semester 7 for Department 1
(31, 1, 1, 7),
(32, 1, 2, 7),
(33, 1, 3, 7),
(34, 1, 4, 7),
(35, 1, 47, 7), -- Basic or Art course

-- Semester 8 for Department 1
(36, 1, 5, 8),
(37, 1, 6, 8),
(38, 1, 7, 8),
(39, 1, 8, 8),
(40, 1, 48, 8); -- Basic or Art course


-- Allocation data for Department 2
INSERT INTO Department_Course_Allocation (allocation_id, department_id, course_id, semester)
VALUES
-- Semester 1 for Department 2
(41, 2, 9, 1), -- Circuit Analysis
(42, 2, 10, 1), -- Digital Electronics
(43, 2, 41, 1), -- Calculus I (Basic/Art course)
(44, 2, 44, 1), -- General Physics I (Basic/Art course)
(45, 2, 47, 1), -- English Communication Skills (Basic/Art course)

-- Semester 2 for Department 2
(46, 2, 11, 2), -- Electromagnetic Theory
(47, 2, 12, 2), -- Control Systems
(48, 2, 42, 2), -- Calculus II (Basic/Art course)
(49, 2, 45, 2), -- General Physics II (Basic/Art course)
(50, 2, 48, 2), -- Technical Writing (Basic/Art course)

-- Semester 3 for Department 2
(51, 2, 13, 3), -- Power Systems
(52, 2, 14, 3), -- Signals and Systems
(53, 2, 43, 3), -- Linear Algebra (Basic/Art course)
(54, 2, 46, 3), -- General Chemistry (Basic/Art course)
(55, 2, 49, 3), -- Ethics and Professional Practice (Basic/Art course)

-- Semester 4 for Department 2
(56, 2, 15, 4), -- Microprocessors and Microcontrollers
(57, 2, 16, 4), -- Communication Systems
(58, 2, 47, 4), -- English Communication Skills (Basic/Art course)
(59, 2, 41, 4), -- Calculus I (Basic/Art course)
(60, 2, 50, 4), -- Economics (Basic/Art course)

-- Semester 5 for Department 2
(61, 2, 12, 5), -- Control Systems
(62, 2, 9, 5), -- Circuit Analysis
(63, 2, 42, 5), -- Calculus II (Basic/Art course)
(64, 2, 48, 5), -- Technical Writing (Basic/Art course)
(65, 2, 44, 5), -- General Physics I (Basic/Art course)

-- Semester 6 for Department 2
(66, 2, 10, 6), -- Digital Electronics
(67, 2, 14, 6), -- Signals and Systems
(68, 2, 46, 6), -- General Chemistry (Basic/Art course)
(69, 2, 43, 6), -- Linear Algebra (Basic/Art course)
(70, 2, 45, 6), -- General Physics II (Basic/Art course)

-- Semester 7 for Department 2
(71, 2, 13, 7), -- Power Systems
(72, 2, 15, 7), -- Microprocessors and Microcontrollers
(73, 2, 41, 7), -- Calculus I (Basic/Art course)
(74, 2, 47, 7), -- English Communication Skills (Basic/Art course)
(75, 2, 50, 7), -- Economics (Basic/Art course)

-- Semester 8 for Department 2
(76, 2, 11, 8), -- Electromagnetic Theory
(77, 2, 16, 8), -- Communication Systems
(78, 2, 48, 8), -- Technical Writing (Basic/Art course)
(79, 2, 49, 8), -- Ethics and Professional Practice (Basic/Art course)
(80, 2, 44, 8); -- General Physics I (Basic/Art course)


-- Allocation data for Department 3
INSERT INTO Department_Course_Allocation (allocation_id, department_id, course_id, semester)
VALUES
-- Semester 1 for Department 3
(81, 3, 17, 1), -- Thermodynamics
(82, 3, 18, 1), -- Fluid Mechanics
(83, 3, 41, 1), -- Calculus I (Basic/Art course)
(84, 3, 44, 1), -- General Physics I (Basic/Art course)
(85, 3, 47, 1), -- English Communication Skills (Basic/Art course)

-- Semester 2 for Department 3
(86, 3, 19, 2), -- Mechanics of Materials
(87, 3, 20, 2), -- Machine Design
(88, 3, 42, 2), -- Calculus II (Basic/Art course)
(89, 3, 45, 2), -- General Physics II (Basic/Art course)
(90, 3, 48, 2), -- Technical Writing (Basic/Art course)

-- Semester 3 for Department 3
(91, 3, 21, 3), -- Heat Transfer
(92, 3, 22, 3), -- Manufacturing Processes
(93, 3, 43, 3), -- Linear Algebra (Basic/Art course)
(94, 3, 46, 3), -- General Chemistry (Basic/Art course)
(95, 3, 49, 3), -- Ethics and Professional Practice (Basic/Art course)

-- Semester 4 for Department 3
(96, 3, 23, 4), -- Dynamics
(97, 3, 24, 4), -- Control Systems
(98, 3, 47, 4), -- English Communication Skills (Basic/Art course)
(99, 3, 41, 4), -- Calculus I (Basic/Art course)
(100, 3, 50, 4), -- Economics (Basic/Art course)

-- Semester 5 for Department 3
(101, 3, 18, 5), -- Fluid Mechanics
(102, 3, 17, 5), -- Thermodynamics
(103, 3, 42, 5), -- Calculus II (Basic/Art course)
(104, 3, 48, 5), -- Technical Writing (Basic/Art course)
(105, 3, 44, 5), -- General Physics I (Basic/Art course)

-- Semester 6 for Department 3
(106, 3, 19, 6), -- Mechanics of Materials
(107, 3, 20, 6), -- Machine Design
(108, 3, 46, 6), -- General Chemistry (Basic/Art course)
(109, 3, 43, 6), -- Linear Algebra (Basic/Art course)
(110, 3, 45, 6), -- General Physics II (Basic/Art course)

-- Semester 7 for Department 3
(111, 3, 21, 7), -- Heat Transfer
(112, 3, 22, 7), -- Manufacturing Processes
(113, 3, 41, 7), -- Calculus I (Basic/Art course)
(114, 3, 47, 7), -- English Communication Skills (Basic/Art course)
(115, 3, 50, 7), -- Economics (Basic/Art course)

-- Semester 8 for Department 3
(116, 3, 23, 8), -- Dynamics
(117, 3, 24, 8), -- Control Systems
(118, 3, 48, 8), -- Technical Writing (Basic/Art course)
(119, 3, 49, 8), -- Ethics and Professional Practice (Basic/Art course)
(120, 3, 44, 8); -- General Physics I (Basic/Art course)


-- Allocation data for Department 4
INSERT INTO Department_Course_Allocation (allocation_id, department_id, course_id, semester)
VALUES
-- Semester 1 for Department 4
(121, 4, 25, 1), -- Engineering Mechanics
(122, 4, 26, 1), -- Structural Analysis
(123, 4, 41, 1), -- Calculus I (Basic/Art course)
(124, 4, 44, 1), -- General Physics I (Basic/Art course)
(125, 4, 47, 1), -- English Communication Skills (Basic/Art course)

-- Semester 2 for Department 4
(126, 4, 27, 2), -- Geotechnical Engineering
(127, 4, 28, 2), -- Transportation Engineering
(128, 4, 42, 2), -- Calculus II (Basic/Art course)
(129, 4, 45, 2), -- General Physics II (Basic/Art course)
(130, 4, 48, 2), -- Technical Writing (Basic/Art course)

-- Semester 3 for Department 4
(131, 4, 29, 3), -- Environmental Engineering
(132, 4, 30, 3), -- Construction Management
(133, 4, 43, 3), -- Linear Algebra (Basic/Art course)
(134, 4, 46, 3), -- General Chemistry (Basic/Art course)
(135, 4, 49, 3), -- Ethics and Professional Practice (Basic/Art course)

-- Semester 4 for Department 4
(136, 4, 31, 4), -- Hydraulics
(137, 4, 32, 4), -- Surveying
(138, 4, 47, 4), -- English Communication Skills (Basic/Art course)
(139, 4, 41, 4), -- Calculus I (Basic/Art course)
(140, 4, 50, 4), -- Economics (Basic/Art course)

-- Semester 5 for Department 4
(141, 4, 26, 5), -- Structural Analysis
(142, 4, 25, 5), -- Engineering Mechanics
(143, 4, 42, 5), -- Calculus II (Basic/Art course)
(144, 4, 48, 5), -- Technical Writing (Basic/Art course)
(145, 4, 44, 5), -- General Physics I (Basic/Art course)

-- Semester 6 for Department 4
(146, 4, 27, 6), -- Geotechnical Engineering
(147, 4, 28, 6), -- Transportation Engineering
(148, 4, 46, 6), -- General Chemistry (Basic/Art course)
(149, 4, 43, 6), -- Linear Algebra (Basic/Art course)
(150, 4, 45, 6), -- General Physics II (Basic/Art course)

-- Semester 7 for Department 4
(151, 4, 29, 7), -- Environmental Engineering
(152, 4, 30, 7), -- Construction Management
(153, 4, 41, 7), -- Calculus I (Basic/Art course)
(154, 4, 47, 7), -- English Communication Skills (Basic/Art course)
(155, 4, 50, 7), -- Economics (Basic/Art course)

-- Semester 8 for Department 4
(156, 4, 31, 8), -- Hydraulics
(157, 4, 32, 8), -- Surveying
(158, 4, 48, 8), -- Technical Writing (Basic/Art course)
(159, 4, 49, 8), -- Ethics and Professional Practice (Basic/Art course)
(160, 4, 44, 8); -- General Physics I (Basic/Art course)


-- Allocation data for Department 5
INSERT INTO Department_Course_Allocation (allocation_id, department_id, course_id, semester)
VALUES
-- Semester 1 for Department 5
(161, 5, 33, 1), -- Chemical Process Calculations
(162, 5, 34, 1), -- Heat Transfer
(163, 5, 41, 1), -- Calculus I (Basic/Art course)
(164, 5, 44, 1), -- General Physics I (Basic/Art course)
(165, 5, 47, 1), -- English Communication Skills (Basic/Art course)

-- Semester 2 for Department 5
(166, 5, 35, 2), -- Mass Transfer
(167, 5, 36, 2), -- Chemical Reaction Engineering
(168, 5, 42, 2), -- Calculus II (Basic/Art course)
(169, 5, 45, 2), -- General Physics II (Basic/Art course)
(170, 5, 48, 2), -- Technical Writing (Basic/Art course)

-- Semester 3 for Department 5
(171, 5, 37, 3), -- Process Control
(172, 5, 38, 3), -- Chemical Process Industries
(173, 5, 43, 3), -- Linear Algebra (Basic/Art course)
(174, 5, 46, 3), -- General Chemistry (Basic/Art course)
(175, 5, 49, 3), -- Ethics and Professional Practice (Basic/Art course)

-- Semester 4 for Department 5
(176, 5, 39, 4), -- Plant Design
(177, 5, 40, 4), -- Polymer Engineering
(178, 5, 47, 4), -- English Communication Skills (Basic/Art course)
(179, 5, 41, 4), -- Calculus I (Basic/Art course)
(180, 5, 50, 4), -- Economics (Basic/Art course)

-- Semester 5 for Department 5
(181, 5, 34, 5), -- Heat Transfer
(182, 5, 35, 5), -- Mass Transfer
(183, 5, 42, 5), -- Calculus II (Basic/Art course)
(184, 5, 48, 5), -- Technical Writing (Basic/Art course)
(185, 5, 44, 5), -- General Physics I (Basic/Art course)

-- Semester 6 for Department 5
(186, 5, 36, 6), -- Chemical Reaction Engineering
(187, 5, 37, 6), -- Process Control
(188, 5, 46, 6), -- General Chemistry (Basic/Art course)
(189, 5, 43, 6), -- Linear Algebra (Basic/Art course)
(190, 5, 45, 6), -- General Physics II (Basic/Art course)

-- Semester 7 for Department 5
(191, 5, 38, 7), -- Chemical Process Industries
(192, 5, 39, 7), -- Plant Design
(193, 5, 41, 7), -- Calculus I (Basic/Art course)
(194, 5, 47, 7), -- English Communication Skills (Basic/Art course)
(195, 5, 50, 7), -- Economics (Basic/Art course)

-- Semester 8 for Department 5
(196, 5, 40, 8), -- Polymer Engineering
(197, 5, 33, 8), -- Chemical Process Calculations
(198, 5, 48, 8), -- Technical Writing (Basic/Art course)
(199, 5, 49, 8), -- Ethics and Professional Practice (Basic/Art course)
(200, 5, 44, 8); -- General Physics I (Basic/Art course)


--teachers data
INSERT INTO Faculty (faculty_id, first_name, last_name, email, phone_number, address, department_id)
VALUES
-- Faculty for Department 1
(1, 'Dr. Sarah', 'Ahmad', 'sarah.ahmad@university.com', '123-456-7890', '456 Maple St, City, Country', 1),
(2, 'Dr. Asif', 'Malik', 'asif.malik@university.com', '234-567-8901', '789 Pine St, City, Country', 1),
(3, 'Dr. Nadia', 'Khan', 'nadia.khan@university.com', '345-678-9012', '321 Elm St, City, Country', 1),
(4, 'Dr. Bilal', 'Ahmed', 'bilal.ahmed@university.com', '456-789-0123', '654 Oak St, City, Country', 1),
(5, 'Dr. Amna', 'Siddiqui', 'amna.siddiqui@university.com', '567-890-1234', '987 Birch St, City, Country', 1),
(6, 'Dr. Saad', 'Khan', 'saad.khan@university.com', '678-901-2345', '258 Cherry St, City, Country', 1),
(7, 'Dr. Zara', 'Ali', 'zara.ali@university.com', '789-012-3456', '741 Cedar St, City, Country', 1),
(8, 'Dr. Asim', 'Rehman', 'asim.rehman@university.com', '890-123-4567', '963 Maple St, City, Country', 1),
(9, 'Dr. Sana', 'Ahmed', 'sana.ahmed@university.com', '901-234-5678', '852 Oak St, City, Country', 1),
(10, 'Dr. Umair', 'Riaz', 'umair.riaz@university.com', '012-345-6789', '951 Cherry St, City, Country', 1),
(11, 'Dr. Hina', 'Shahid', 'hina.shahid@university.com', '123-456-7891', '357 Pine St, City, Country', 1),
(12, 'Dr. Faraz', 'Hussain', 'faraz.hussain@university.com', '234-567-8902', '159 Cedar St, City, Country', 1),
(13, 'Dr. Samina', 'Khan', 'samina.khan@university.com', '345-678-9013', '852 Birch St, City, Country', 1),
(14, 'Dr. Hassan', 'Akhtar', 'hassan.akhtar@university.com', '456-789-0124', '951 Oak St, City, Country', 1),
(15, 'Dr. Sara', 'Mirza', 'sara.mirza@university.com', '567-890-1235', '753 Maple St, City, Country', 1);


INSERT INTO Faculty (faculty_id, first_name, last_name, email, phone_number, address, department_id)
VALUES
-- Faculty for Department 2
(16, 'Dr. Adnan', 'Khan', 'adnan.khan@university.com', '123-456-1234', '789 Pine St, City, Country', 2),
(17, 'Dr. Farah', 'Malik', 'farah.malik@university.com', '234-567-1234', '654 Maple St, City, Country', 2),
(18, 'Dr. Usman', 'Ahmad', 'usman.ahmad@university.com', '345-678-1234', '321 Oak St, City, Country', 2),
(19, 'Dr. Sara', 'Hussain', 'sara.hussain@university.com', '456-789-2345', '852 Birch St, City, Country', 2),
(20, 'Dr. Ayesha', 'Rehman', 'ayesha.rehman@university.com', '567-890-3456', '159 Cherry St, City, Country', 2),
(21, 'Dr. Umair', 'Khan', 'umair.khan@university.com', '678-901-4567', '753 Cedar St, City, Country', 2),
(22, 'Dr. Maria', 'Ali', 'maria.ali@university.com', '789-012-5678', '741 Oak St, City, Country', 2),
(23, 'Dr. Hasan', 'Naseer', 'hasan.naseer@university.com', '890-123-6789', '951 Maple St, City, Country', 2),
(24, 'Dr. Faraz', 'Shahid', 'faraz.shahid@university.com', '901-234-7890', '258 Birch St, City, Country', 2),
(25, 'Dr. Nadia', 'Ahmed', 'nadia.ahmed@university.com', '012-345-8901', '357 Oak St, City, Country', 2),
(26, 'Dr. Saad', 'Riaz', 'saad.riaz@university.com', '123-456-8901', '654 Cherry St, City, Country', 2),
(27, 'Dr. Zara', 'Khan', 'zara.khan@university.com', '234-567-9012', '951 Cedar St, City, Country', 2),
(28, 'Dr. Asad', 'Hussain', 'asad.hussain@university.com', '345-678-0123', '963 Maple St, City, Country', 2),
(29, 'Dr. Saira', 'Ali', 'saira.ali@university.com', '456-789-1234', '741 Birch St, City, Country', 2),
(30, 'Dr. Raza', 'Rehman', 'raza.rehman@university.com', '567-890-2345', '852 Oak St, City, Country', 2);


INSERT INTO Faculty (faculty_id, first_name, last_name, email, phone_number, address, department_id)
VALUES
-- Faculty for Department 3
(31, 'Dr. Imran', 'Khan', 'imran.khan@university.com', '123-456-1234', '789 Pine St, City, Country', 3),
(32, 'Dr. Sadia', 'Malik', 'sadia.malik@university.com', '234-567-1234', '654 Maple St, City, Country', 3),
(33, 'Dr. Usman', 'Ahmad', 'usman.ahmad@university.com', '345-678-1234', '321 Oak St, City, Country', 3),
(34, 'Dr. Aisha', 'Hussain', 'aisha.hussain@university.com', '456-789-2345', '852 Birch St, City, Country', 3),
(35, 'Dr. Khalid', 'Rehman', 'khalid.rehman@university.com', '567-890-3456', '159 Cherry St, City, Country', 3),
(36, 'Dr. Hamza', 'Khan', 'hamza.khan@university.com', '678-901-4567', '753 Cedar St, City, Country', 3),
(37, 'Dr. Amna', 'Ali', 'amna.ali@university.com', '789-012-5678', '741 Oak St, City, Country', 3),
(38, 'Dr. Hassan', 'Naseer', 'hassan.naseer@university.com', '890-123-6789', '951 Maple St, City, Country', 3),
(39, 'Dr. Umar', 'Shahid', 'umar.shahid@university.com', '901-234-7890', '258 Birch St, City, Country', 3),
(40, 'Dr. Farah', 'Ahmed', 'farah.ahmed@university.com', '012-345-8901', '357 Oak St, City, Country', 3),
(41, 'Dr. Saad', 'Riaz', 'saad.riaz@university.com', '123-456-8901', '654 Cherry St, City, Country', 3),
(42, 'Dr. Zara', 'Khan', 'zara.khan@university.com', '234-567-9012', '951 Cedar St, City, Country', 3),
(43, 'Dr. Hamid', 'Ali', 'hamid.ali@university.com', '345-678-0123', '963 Maple St, City, Country', 3),
(44, 'Dr. Sara', 'Hussain', 'sara.hussain@university.com', '456-789-1234', '741 Birch St, City, Country', 3),
(45, 'Dr. Raza', 'Rehman', 'raza.rehman@university.com', '567-890-2345', '852 Oak St, City, Country', 3);


INSERT INTO Faculty (faculty_id, first_name, last_name, email, phone_number, address, department_id)
VALUES
(46, 'Dr. Bilal', 'Khan', 'bilal.khan@university.com', '123-456-5678', '123 Elm St, City, Country', 4),
(47, 'Dr. Nadia', 'Malik', 'nadia.malik@university.com', '234-567-6789', '456 Oak St, City, Country', 4),
(48, 'Dr. Ali', 'Ahmed', 'ali.ahmed@university.com', '345-678-7890', '789 Maple St, City, Country', 4),
(49, 'Dr. Saima', 'Hussain', 'saima.hussain@university.com', '456-789-8901', '852 Birch St, City, Country', 4),
(50, 'Dr. Faisal', 'Rehman', 'faisal.rehman@university.com', '567-890-9012', '159 Cherry St, City, Country', 4),
(51, 'Dr. Rida', 'Ali', 'rida.ali@university.com', '678-901-0123', '753 Cedar St, City, Country', 4),
(52, 'Dr. Asad', 'Khan', 'asad.khan@university.com', '789-012-1234', '741 Elm St, City, Country', 4),
(53, 'Dr. Zainab', 'Ahmed', 'zainab.ahmed@university.com', '890-123-2345', '951 Oak St, City, Country', 4),
(54, 'Dr. Kamran', 'Hussain', 'kamran.hussain@university.com', '901-234-3456', '258 Maple St, City, Country', 4),
(55, 'Dr. Maryam', 'Shahid', 'maryam.shahid@university.com', '012-345-4567', '357 Birch St, City, Country', 4),
(56, 'Dr. Hasan', 'Riaz', 'hasan.riaz@university.com', '123-456-5678', '654 Cedar St, City, Country', 4),
(57, 'Dr. Saad', 'Khan', 'saad.khan@university.com', '234-567-6789', '951 Elm St, City, Country', 4),
(58, 'Dr. Iman', 'Ali', 'iman.ali@university.com', '345-678-7890', '963 Oak St, City, Country', 4),
(59, 'Dr. Ali', 'Rehman', 'ali.rehman@university.com', '456-789-8901', '741 Cherry St, City, Country', 4),
(60, 'Dr. Sana', 'Hussain', 'sana.hussain@university.com', '567-890-9012', '852 Elm St, City, Country', 4);


INSERT INTO Faculty (faculty_id, first_name, last_name, email, phone_number, address, department_id)
VALUES
(61, 'Dr. Umer', 'Khan', 'umer.khan@university.com', '123-456-6789', '123 Oak St, City, Country', 5),
(62, 'Dr. Samina', 'Malik', 'samina.malik@university.com', '234-567-7890', '456 Maple St, City, Country', 5),
(63, 'Dr. Tahir', 'Ahmed', 'tahir.ahmed@university.com', '345-678-8901', '789 Birch St, City, Country', 5),
(64, 'Dr. Asma', 'Hussain', 'asma.hussain@university.com', '456-789-9012', '852 Cedar St, City, Country', 5),
(65, 'Dr. Hamza', 'Rehman', 'hamza.rehman@university.com', '567-890-0123', '159 Cherry St, City, Country', 5),
(66, 'Dr. Farah', 'Ali', 'farah.ali@university.com', '678-901-1234', '753 Elm St, City, Country', 5),
(67, 'Dr. Saeed', 'Khan', 'saeed.khan@university.com', '789-012-2345', '741 Maple St, City, Country', 5),
(68, 'Dr. Naveed', 'Ahmed', 'naveed.ahmed@university.com', '890-123-3456', '951 Birch St, City, Country', 5),
(69, 'Dr. Khalid', 'Hussain', 'khalid.hussain@university.com', '901-234-4567', '258 Oak St, City, Country', 5),
(70, 'Dr. Maira', 'Shahid', 'maira.shahid@university.com', '012-345-5678', '357 Cherry St, City, Country', 5),
(71, 'Dr. Hina', 'Riaz', 'hina.riaz@university.com', '123-456-6789', '654 Cedar St, City, Country', 5),
(72, 'Dr. Zaheer', 'Khan', 'zaheer.khan@university.com', '234-567-7890', '951 Elm St, City, Country', 5),
(73, 'Dr. Anam', 'Ali', 'anam.ali@university.com', '345-678-8901', '963 Oak St, City, Country', 5),
(74, 'Dr. Raza', 'Rehman', 'raza.rehman@university.com', '456-789-9012', '741 Birch St, City, Country', 5),
(75, 'Dr. Seema', 'Hussain', 'seema.hussain@university.com', '567-890-0123', '852 Cedar St, City, Country', 5);



-- Begin allocation of courses to teachers

-- Initialize allocation_id, which should start from 1
DECLARE @allocation_id INT = 1;

-- Iterate through courses and teachers using nested loops
-- Outer loop for each course
DECLARE course_cursor CURSOR FOR
SELECT course_id FROM Courses;

DECLARE @course_id INT;
OPEN course_cursor;
FETCH NEXT FROM course_cursor INTO @course_id;

-- Inner loop for each teacher
DECLARE teacher_cursor CURSOR FOR
SELECT faculty_id FROM Faculty;

DECLARE @faculty_id INT;
OPEN teacher_cursor;
FETCH NEXT FROM teacher_cursor INTO @faculty_id;

-- Perform allocation while there are teachers and courses available
WHILE (@@FETCH_STATUS = 0)
BEGIN
    -- Allocate current course to the current teacher
    INSERT INTO Faculty_Course_Allocation (allocation_id, faculty_id, course_id)
    VALUES (@allocation_id, @faculty_id, @course_id);

    -- Increment allocation_id
    SET @allocation_id = @allocation_id + 1;

    -- Move to next teacher
    FETCH NEXT FROM teacher_cursor INTO @faculty_id;

    -- Check if there are no more teachers
    IF @@FETCH_STATUS != 0
    BEGIN
        -- If no more teachers, restart the loop for the list of teachers
        CLOSE teacher_cursor;
        OPEN teacher_cursor;
        FETCH NEXT FROM teacher_cursor INTO @faculty_id;
    END

    -- Move to next course
    FETCH NEXT FROM course_cursor INTO @course_id;
END

-- Close cursors and clean up
CLOSE course_cursor;
DEALLOCATE course_cursor;

CLOSE teacher_cursor;
DEALLOCATE teacher_cursor;

-- End of allocation
