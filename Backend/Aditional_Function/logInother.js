
const mysql_con = require('../DbConnection')

const logInother=(req, res) => {
    try {
       const { email, password } = req.body;
       var sql = "SELECT * FROM students WHERE email=? AND password=?";
       console.log('here 1');
        mysql_con.query(sql, [email, password], function(err, result){
            console.log(result);
            if (err) console.log('err');
            res.json(result);
        })

    } catch (error) {
        res.json({ message: 'Server internal Problem' })
    }

}



module.exports = logInother;