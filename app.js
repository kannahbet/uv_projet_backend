const express = require('express');
const mongoose = require('mongoose');
const Thing = require('./models/thing');

mongoose.connect('mongodb+srv://papai:kannabe@cluster0.pejoepy.mongodb.net/?retryWrites=true&w=majority',
  { useNewUrlParser: true,
    useUnifiedTopology: true })
  .then(() => console.log('Connexion à MongoDB réussie !'))
  .catch(() => console.log('Connexion à MongoDB échouée !'));
  

const app = express();

app.use(express.json());

app.use(cors());

app.use(express.urlencoded({extended:true }))

//initialize the data base
require('./dataBaseConnexion')();

app.all('/test',(req, res)=>{
    // console.log(req.query);
    // res.send(req.query)

    // console.log(req.params);
    // res.send(req.params) 
    //let me push my app 
    //jjjjjjj

    console.log(req.body),
    res.send(req.body)
})
const ThingRoutes = require('./Routes/Things.routes');
app.use("/", ThingRoutes);

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
