const mysql_con = require('../DbConnection')


const register_course = (req, res) => {
    try {
        const { department_id, semester, student_id } = req.body; // Access data from request body

        // Validation (optional, consider using a library like Joi)
        if (!department_id || !semester || !student_id) {
            return res.status(400).json({ message: 'Missing required parameters' });
        }

        let query = `SELECT C.course_id, C.course_name, CONCAT(F.first_name, ' ', F.last_name) AS faculty_name, C.course_credit FROM Courses C
            INNER JOIN faculty_course_allocation FCA ON C.course_id = FCA.course_id
            INNER JOIN Faculty F ON F.faculty_id = FCA.faculty_id
            WHERE C.semester = ? AND C.department_id = ? AND C.course_id NOT IN (SELECT course_id FROM Enrollments WHERE student_id=?)`;

        mysql_con.query(query, [semester, department_id, student_id], (error, result) => {
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
};


module.exports = register_course;