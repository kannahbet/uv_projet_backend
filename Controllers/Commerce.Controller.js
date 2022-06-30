const connection = require('../mysqlConnexion')
const connectionentrepot = require('../connectionEntrepot')

module.exports = {
    getAllProduct: async (req,res,next) =>{
       
        var query = "SELECT DISTINCT p.`Refpro` , p.`title` , c.`nom` FROM commerce.produit p, commerce.cathegories c where p.`category`=c.`codeC`";
        connection.query(query,(err,result) =>{
            if(!err){
                 var product=result;
                // console.log(product)
                product.forEach(insertInMart);
            } else{
                console.log("echec")
            }
            
        })

        insertInMart = (product) =>{
            querry = "INSERT INTO produits(idProduits,NomProd,CatProd) VALUES(?,?,?)";
            connectionentrepot.query(querry,[product.Refpro,product.title,product.nom],(err,results)=>{
                if(!err){
                    console.log(product.nom)
                }
            })
        }
        res.status(200).json({message:"succes pour produit"})
        next()
       
    },

    getAllUsers: async (req,res, next) =>{
        var query = " SELECT code_client , email, username , first_name, last_name, title FROM client";
        connection.query(query,(err1,result1) =>{
            if(!err1){
                var client = result1;
                client.forEach(insertInMart1)
            }
            else{
                console.log("echec")
            }
            
        })

        insertInMart1 = (client) =>{
            querry = "INSERT INTO clients(idClients,NomClient,Pays) VALUES(?,?,?)";
            connectionentrepot.query(querry,[client.code_client,client.username,client.first_name],(err,results)=>{
                if(!err){
                    console.log(client.username)
                }
            })
        }
        res.status(200).json({message:"succes pour client"})
        next();
    },

    getAllTemps: async (req,res, next) =>{
        let date = new Date();
        let jour = date.getDate()
        let mois = date.getMonth()

        var query =  "SELECT DISTINCT Datecommande FROM commande c"
        connection.query(query,(err2,result2) =>{
            if(!err2){
                var commande = result2;
                commande.forEach(insertInMart2)
            }
            else{
                console.log('Echec')
            }
        })

        insertInMart2 = (commande) =>{
            querry = "INSERT INTO temps(jours,Mois) VALUES(?,?)";
            let date = commande.Datecommande;
            let jour = date.getDate()
            let mois = date.getMonth()+1;
            let years = date.getFullYear()
            let format=years+"-"+mois+"-"+jour+" 00:00"
            console.log(format)
            connectionentrepot.query(querry,[format,mois],(err,results)=>{
                if(!err){
                    console.log(jour+"-"+mois)
                }
            })
        }
        res.status(200).json({message:"succes pour commande"})
        next();
    },


    // getAllVente: async (req,res, next) =>{
    //     var query =  "SELECT sum(d.`quantite`) as quantity,sum(d.`quantite`*p.price) as prix, date(c.`Datecommande`) as date,p.`Refpro`, CAST(clt.`Code_client` as varchar(10)) as `codeC` FROM `details _commande` d,`produit` p , `commande` c , `client` clt where clt.`Code_client` = c.`destinataire`and c. `id_commande`=d.`ref_comma` and p.`Refpro`=d.`ref_prod` group by month(c.`dateCommande`),p.`Refpro`, clt.`code_client`"
    //     connection.query(query,(err3,result3) =>{
    //         if(!err3){
    //             var vente = result3;
    //             vente.forEach(insertInMart3)
    //         }
    //         else{
    //             return res.status(500).json(err2)
    //         }
    //         next();
    //     })

    //     insertInMart1 = (vente) =>{
    //         querry = "INSERT INTO ventes(QuantiteVentes,MontantVentes,Temps_jours,Produits_idProduits,Clients_idClients) VALUES(?,?,?,?,?)";
    //         connectionentrepot.query(querry,[vente.quantity, vente.prix,vente.date,vente.Refpro,vente.codeC,],(err,results)=>{
    //             if(!err){
    //                 console.log(product.nom)
    //             }
    //         })
    //     }
    // },

    // getAllTemps: async (req,res, next) =>{
    //     var query =  "SELECT DISTINCT Date(c.`Datecommande`), month(c.`Moiscommande`) FROM commande c"
    //     connection.query(query,(err4,result4) =>{
    //         if(!err4){
    //             var temps = result3;
    //             temps.forEach(insertInMart4)
    //         }
    //         else{
    //             return res.status(500).json(err4)
    //         }
    //         next();
    //     })

    //     insertInMart1 = (temps) =>{
    //         querry = "INSERT INTO ventes(QuantiteVentes,MontantVentes,Temps_jours,Produits_idProduits,Clients_idClients) VALUES(?,?,?,?,?)";
    //         connectionentrepot.query(querry,[temps.Datecommande,temps.Moiscommande],(err,results)=>{
    //             if(!err){
    //                 console.log(product.nom)
    //             }
    //         })
    //     }
    // }
}
