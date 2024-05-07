const mysql_con=require('../DbConnection');

const Registered_in_course=(req, res) => {
    try {
        const { student_id, course_id } = req.body; // Access data from request body

        // Validation (optional, consider using a library like Joi)
        if (!student_id || !course_id) {
            return res.status(400).json({ message: 'Missing required parameters' });
        }
        const query = `INSERT INTO Enrollments (student_id,course_id,enrollment_date) VALUES (?,?,CURDATE())`;
        mysql_con.query(query, [student_id, course_id], (error, result) => {
            if (error) {
                console.error('Error executing MySQL query:', error);
                return res.status(500).json({ message: 'Error registering course' });
            }
            const query1 = `INSERT INTO Attendance(student_id,course_id,attendance_percentage)VALUES(${student_id},?,0)`;
            mysql_con.query(query1, [course_id], (error, result) => {
                if (error) {
                    console.log("Error in inserting data in attendance");
                    console.error('Error in inserting data in attendence:', error);
                    return res.status(500).json({ message: 'Error retrieving course data' });
                }
                const query2 = `INSERT INTO grades(student_id,course_id) VALUES(?,?)`;
                mysql_con.query(query2, [student_id,course_id], (error, result) => {
                    if (error) {
                        console.log("Error in inserting data in grades ");
                        console.error('Error in inserting data in grades:', error);
                        return res.status(500).json({ message: 'Error retrieving course data' });
                    }
                    console.log(result);
                    res.json(result);
                });
            });
        });

    } catch (error) {
        console.error('Error handling request:', error);
        res.status(500).json({ message: 'Internal server error' });

    }
}


module.exports=Registered_in_course;