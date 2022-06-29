const express = require("express");
const cors = require("cors");
const createError = require("http-errors");
//initialize the data base
const connection = require('./mysqlConnexion');
const app = express();


app.use(express.json());

app.use(cors());

app.use(express.urlencoded({extended:true }))




const commerceRoutes = require('./Routes/Commerce.mysql.routes');
app.use("/", commerceRoutes);

app.use((req,res,next) =>{
    // const theError = new Error("Not found");
    // theError.status = 404;


    
    // next(theError);
    next(createError(404,"Not Found"));
})

//Error Handler
app.use((err, req, res, next) =>{
    res.status(err.status || 500 ); 
    res.send({
        error:{
            status: err.status || 500,
            message: err.message
        }
    });
});

const PORT = process.env.PORT || 6000
app.listen(PORT, ()=> console.log('The server run on port' + ' ' + PORT + '....'))
