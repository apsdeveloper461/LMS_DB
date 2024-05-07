
const mysql=require('mysql');
//import config of dot env
require('dotenv').config({path:'./.env'});
//Create Connection with mySQL
const mysql_con=mysql.createConnection({
    host:process.env.SERVER,
    user:process.env.USER,
    password:process.env.PASSWORD,
    database:process.env.DB
});
mysql_con.connect((err)=>{
 if(err) throw err;
 console.log('Connected Successfully');
})

module.exports= mysql_con;