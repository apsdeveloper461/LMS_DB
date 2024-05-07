const mysql_con=require('../DbConnection');

const register_student=(req, res) => {

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
}


module.exports = register_student;