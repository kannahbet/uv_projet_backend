const createError = require("http-errors");
const { default: mongoose } = require("mongoose");
const Thing = require('../Models/Thing.model');

 module.exports = {
     getAllThings:async (req,res,next) =>{
        try {
          const result = await Thing.find({},{__v :0});
           res.json({result});
        } catch (error) {
            console.log(error.message)
        }
    },

    findThingById: async (req,res,next) =>{
        const id = req.params.id;
    
        try {
          const thing = await Thing.findById(id);
         // const product = await Product.findOne({_id:id});
          if(!thing){
            throw createError(404,"Thing does not exist");
          }  
           res.json({thing});  
        } catch (error) {
            console.log(error.message);
            if(error instanceof mongoose.CastError){
                next(createError(400, "Invalid thing id"));
               return;
            }
            next(error);
        }
    },

    createNewThing: async (req,res,next) =>{
        try {
            const thing = new Thing(req.body);
            const result = await thing.save();
            res.json({result});
        } catch (error) {
            console.log(error.message);
            if(error.name === 'ValidationError'){
                next(createError(422, error.message));
                return;
            }
            next(error);
        }
        // console.log(req.body);
    
        // const product = new Product({
        //     name: req.body.name,
        //     price: req.body.price
        // });
    
        // product.save()
        // .then(result =>{
        //     console.log(result);
        //     res.send(result);
        // })
        // .catch(err =>{
        //     console.log(err.message);
        // })
    },

    deleteThing: async (req,res,next) =>{
        const id = req.params.id;
        try {
          const result = await Thing.findByIdAndDelete(id);
          
          if(!result){
              throw createError(404,"Thing does not exist");
          }
   
          res.json({result});
        } catch (error) {
            console.log(error.message);
   
            if(error instanceof mongoose.CastError){
                next(createError(400, "Invalid Product id"));
               return;
            }
            next(error);
        }
   },

   updateProduct: async (req,res,next) =>{
        try { 
        const id = req.params.id;
        const updates = req.body;
        const options = {new: true};
        
        const result = await Thing.findByIdAndUpdate(id,updates,options);

        if(!result){
            throw createError(404, "Product does not exist");
        }
        res.json({result});
        } catch (error) {
            console.log(error.message);
            if(error instanceof mongoose.CastError){
                return next(createError(400, "Invalid thing id  "));
            }

            next(error);
        }
    },
 }