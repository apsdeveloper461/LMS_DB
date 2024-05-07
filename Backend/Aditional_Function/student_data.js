const mysql_con=require('../DbConnection');

const student_data= (req, res) => {
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
}


module.exports = student_data;