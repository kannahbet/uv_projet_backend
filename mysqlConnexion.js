const mysql = require('mysql');

    const connection = mysql.createConnection({
        port:3306,
        host:"localhost",
        user:"root",
        password:"",
        database:"commerce"
    });
    
    connection.connect((error) =>{
        if(!error){
            console.log("Connected to source")
        }
        else{
            console.log(error)
        }
    });

    module.exports = connection
