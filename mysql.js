
const mysql = require('mysql');
const con = mysql.createConnection({host: "localhost",user: "root",password: "",database : "commerce" });
 con.connect(function(err) {
   if (err) throw err;
   console.log("Connecté à la base de données MySQL!");
const client= con.query(" SELECT code_client , email, username , first_name, last_name, title FROM client", function (err, result) {
       if (err) throw err;
       {
     
          console.log(result);
       }
     
     });
     const produit=con.query("SELECT DISTINCT p.`Refpro` , p.`title` , c.`nom` FROM commerce.produit p, commerce.cathegories c where p.`category`=c.`codeC`;", function (err, result) {
      if (err) throw err;
      console.log(result);
    });
    const temps=con.query("SELECT DISTINCT Date(c.`Datecommande`), month(c.`Datecommande`) FROM commande c", function (err, result) {
      if (err) throw err;
      console.log(result);
    });   
    const faits=con.query("SELECT sum(d.`quantite`) as quantity,sum(d.`quantite`*p.price) as prix, date(c.`Datecommande`) as date,p.`Refpro`, CAST(clt.`Code_client` as varchar(10)) as `codeC` FROM `details _commande` d,`produit` p , `commande` c , `client` clt where clt.`Code_client` = c.`destinataire`and c. `id_commande`=d.`ref_comma` and p.`Refpro`=d.`ref_prod` group by month(c.`dateCommande`),p.`Refpro`, clt.`code_client`;", function (err, result) {
      if (err) throw err;
      console.log(result);
    });
 });
 