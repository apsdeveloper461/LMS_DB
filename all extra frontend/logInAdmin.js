// const mysql_con = require('../DbConnection')


// const logInAdmin= (req, res) => {
//     const { email, password} = req.body;
//     var sql = "SELECT * FROM aps_admin WHERE email=? AND password=?";
//     try {
//         mysql_con.query(sql, [email, password], function(err, result){
//             if (err) console.log('err');
//             if (result!=0) res.json({ message: 'success' });
//             else res.json({ message: 'failed' });
//         })

//     } catch (error) {
//         res.json({ message: 'Server internal Problem' })
//     }
// }

// module.exports=logInAdmin;