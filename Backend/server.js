const express = require('express');
const cors = require('cors');
const mysql_con = require('./DbConnection')
const app = express();
//import log In Function
// const logInAdmin = require('./Aditional_Function/logInAdmin');
const logInother = require('./Aditional_Function/logInother');
const register_course = require('./Aditional_Function/register_course');


app.use(cors())
app.use(express.json());


app.post('/studentdata', (req, res) => {
    try {
        const { student_id } = req.body;
        // console.log(studentId);

        // Assuming you have some function to fetch student data based on the studentId
        // Replace the URL and implementation with your actual logic to fetch student data
        var sql = "SELECT * FROM Students S, departments D where S.department_id=D.department_id AND Student_id=?";
        mysql_con.query(sql, [student_id], (err, result) => {
            if (err) console.log(err);
            else {
                console.log(result);
                res.json(result);
            }
        });
    } catch (error) {
        console.error('Error fetching student data:', error);
        res.status(500).json({ message: 'Error retrieving student data' });
    }
});


app.post('/department', (req, res) => {
    let sql = "SELECT * from Departments";
    mysql_con.query(sql, (err, result) => {
        if (err) console.log(err);
        else {
            console.log(result);
            res.json(result);
        }
    })
})
app.post('/register_student', (req, res) => {

    try {
        const { first_name, last_name, address, email, password, date_of_birth, gender, phone_no, department_id } = req.body;
        // console.log(student_id);
        console.log(first_name, last_name, address, email, password, department_id, date_of_birth, gender, phone_no);
        var sql = "INSERT INTO Students (first_name,last_name,address,phone_number,email,password,date_of_birth,gender,department_id,semester) Values(?,?,?,?,?,?,?,?,?,1)"
        mysql_con.query(sql, [first_name, last_name, address, phone_no, email, password, date_of_birth, gender, department_id], (error, result) => {
            if (error) {
                console.error('Error executing MySQL query:', error);
                return res.status(500).json({ message: 'Error registering student' });
            }
            console.log(result);
            res.json(result);
        });

    } catch (error) {
        console.error('Error handling request:', error);
        res.json({ message: 'Internal server error' });

    }
})
app.post('/login', logInother)
app.post('/student/register_course', register_course);

app.post('/student/registered_in_course', (req, res) => {
    try {
        const { student_id, course_id } = req.body; // Access data from request body

        // Validation (optional, consider using a library like Joi)
        if (!student_id || !course_id) {
            return res.status(400).json({ message: 'Missing required parameters' });
        }
        const query = `INSERT INTO Enrollments (student_id,course_id,enrollment_date) VALUES (?,?,NOW())`;
        mysql_con.query(query, [student_id, course_id], (error, result) => {
            if (error) {
                console.error('Error executing MySQL query:', error);
                return res.status(500).json({ message: 'Error registering course' });
            }
           const query1 = `INSERT INTO Attendance(student_id,course_id,attendance_percentage)VALUES(${student_id},?,0)`;
            mysql_con.query(query1, [course_id], (error, result) => {
                if (error) {
                    console.log("Error");
                    console.error('Error executing MySQL query:', error);
                    return res.status(500).json({ message: 'Error retrieving course data' });
                }
                console.log(result);
                res.json(result);
            });
        });

    } catch (error) {
        console.error('Error handling request:', error);
        res.status(500).json({ message: 'Internal server error' });

    }
})

app.post('/student/enroll_course', (req, res) => {
    try {
        const { student_id } = req.body; // Access data from request body

        // Validation (optional, consider using a library like Joi)
        if (!student_id) {
            return res.status(400).json({ message: 'Missing required parameters' });
        }

        const query = `SELECT EN.student_id,C.course_id,C.course_name,C.course_credit, CONCAT(F.first_name, ' ', F.last_name) AS faculty_name, EN.enrollment_date from Enrollments EN  inner join Courses C ON EN.course_id=C.course_id Inner Join faculty_course_allocation FCA ON C.course_id=FCA.course_id Inner Join Faculty F ON F.Faculty_id=FCA.faculty_id WHERE  EN.student_id=?`;

        mysql_con.query(query, [student_id], (error, result) => {
            if (error) {
                console.error('Error executing MySQL query:', error);
                return res.status(500).json({ message: 'Error retrieving course data' });
            }
            console.log(result);
            res.json(result);
        });
    } catch (error) {
        console.error('Error handling request:', error);
        res.status(500).json({ message: 'Internal server error' });
    }
})

app.post('/student/attendance',(req,res)=>{
    try {
        const { student_id } = req.body; // Access data from request body

        // Validation (optional, consider using a library like Joi)
        if (!student_id) {
            return res.status(400).json({ message: 'Missing required parameters' });
        }

        const query = `SELECT ATT.student_id,C.course_id,C.course_name,C.course_credit, CONCAT(F.first_name, ' ', F.last_name) AS faculty_name,ATT.attendance_percentage  from Attendance ATT  inner join Courses C ON ATT.course_id=C.course_id Inner Join faculty_course_allocation FCA ON C.course_id=FCA.course_id Inner Join Faculty F ON F.Faculty_id=FCA.faculty_id WHERE  ATT.student_id=?`;

        mysql_con.query(query, [student_id], (error, result) => {
            if (error) {
                console.error('Error executing MySQL query:', error);
                return res.status(500).json({ message: 'Error retrieving course data' });
            }
            console.log(result);
            res.json(result);
        });
    } catch (error) {
        console.error('Error handling request:', error);
        res.status(500).json({ message: 'Internal server error' });
    }
})
app.listen(5000, () => console.log("Running on Server"))