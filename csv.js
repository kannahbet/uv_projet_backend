const Papa = require("papaparse"),
  fs = require("fs");
  
const connectionentrepot = require('./connectionEntrepot')

var query = "SELECT * FROM ventes`";
connectionentrepot.query(query,(err,result) =>{
            if(!err){
                 
try {
    var csv_data = Papa.unparse(result);
    fs.writeFile("./export.csv", csv_data, { flag: 'w' }, function(){
      console.log(csv_data);
    });
  } catch(e){
    console.error(e);
  }
               
                console.log(result)
            } else{
                console.log("echec")
            }
})

 
  
