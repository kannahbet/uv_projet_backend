const mysqli = require('mysql');
    const connectionentrepot = mysqli.createConnection({
        port:3306,
        host:"localhost",
        user:"root",
        password:"",
        database:"entrepot"
    });
    connectionentrepot.connect((error) =>{
        if(!error){
            console.log("Connected to vente_datamart")
        }
        else{
            console.log(error)
        }
    });

    module.exports = connectionentrepot