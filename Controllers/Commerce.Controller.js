const connection = require('../mysqlConnexion')
const connectionentrepot = require('../connectionEntrepot')
const Papa = require("papaparse"),
  fs = require("fs");
  

module.exports = {
    getAllProduct: async (req,res,next) =>{
       
        var query = "SELECT DISTINCT p.`Refpro` ,p.`price` , p.`title` , c.`nom` FROM commerce.produit p, commerce.cathegories c where p.`category`=c.`codeC`";
        connection.query(query,(err,result) =>{
            if(!err){
                 var product=result;
                // console.log(product)
                product.forEach(insertInMart);
            } else{
                res.status(404).json({message:"echec pour insertion produit"})
            }
            
        })

        insertInMart = (product) =>{
            querry = "INSERT INTO produits(idProduits,NomProd,CatProd,prix) VALUES(?,?,?,?)";
            connectionentrepot.query(querry,[product.Refpro,product.title,product.nom,product.price],(err,results)=>{
                if(!err){
                    console.log(product.nom)
                }
            })
        }
        res.status(200).json({message:"succes pour produit"})
        next()
       
    },


    getAllTemps: async (req,res, next) =>{
 

        var query =  "SELECT DISTINCT Datecommande FROM commande"
        connection.query(query,(err2,result2) =>{
            if(!err2){
                var commande = result2;
                commande.forEach(insertInMart2)
            }
            else{
                res.status(404).json({message:"echec pour insertion temps"})
            }
        })

        insertInMart2 = (commande) =>{
            querry = "INSERT INTO temps(day,month,year,trimestre) VALUES(?,?,?,?)";
            let date = commande.Datecommande;
            let jour = date.getDate()
            let mois = date.getMonth()+1;
            let trim=0;
            if(mois <4){
                trim=1;  
            } else if(mois<7){
                trim=2;
            }else if(mois<9){
                trim=3;
            }else {
                trim=4;
            }
            let years = date.getFullYear()
          let format=years+"-"+mois+"-"+jour+" 00:00"
            connectionentrepot.query(querry,[format,mois,years,trim],(err,results)=>{
                if(!err){
                    console.log(jour+"-"+mois)
                }
            })
        }
        res.status(200).json({message:"succes pour temps"});
    },


    getAllFaits: async (req,res, next) =>{
        var query =  "SELECT SUM(d.`quantite`) as sales,SUM(d.`quantite`*p.price) as qaunt, c.Datecommande,p.`Refpro` FROM `details _commande` d,`produit` p , `commande` c WHERE c. `id_commande`=d.`ref_comma` AND p.`Refpro`=d.`ref_prod` GROUP BY month(c.`dateCommande`),p.`Refpro`;"
        connection.query(query,(err4,result4) =>{
            if(!err4){
                var temps = result4;
                temps.forEach(insertInMart4)
            }
            else{
                res.status(404).json({message:"echec pour insertion des faits"})
            }
            next();
        })

        insertInMart4 = (faits) =>{
            querry = "INSERT INTO ventes(sales,quantity,Temps_jours,Produits_idProduits) VALUES(?,?,?,?)";
            let date = faits.Datecommande;
            let jour = date.getDate()
            let mois = date.getMonth()+1;
            let years = date.getFullYear()
            let format=years+"-"+mois+"-"+jour+" 00:00"
            connectionentrepot.query(querry,[faits.qaunt,faits.sales,format,faits.Refpro],(err,results)=>{
                if(!err){
                    console.log(faits.sales)
                }
            })
            
        }
        res.status(200).json({message:"succes pour faits"});
    },

    getAllCsv: async (req,res, next) =>  {
        var query = "SELECT idProduits,CatProd,prix,sales,quantity,month,year,trimestre FROM ventes v,produits p,temps t WHERE v.temps_jours=t.day AND v.Produits_idProduits=p.idProduits";
connectionentrepot.query(query,(err,result) =>{
            if(!err){

                res.status(200).json(result);
try {
   var csv_data = Papa.unparse(result);
    fs.writeFile("./export.csv", csv_data, { flag: 'w' }, function(){
        console.log('reussi')
    });
  } catch(e){
    res.status(404).json({message:"echec de creation  csv"})
  }
               
                
            } else{
                res.status(404).json({message:"erreur de requette"})
            }
})
    }
}
