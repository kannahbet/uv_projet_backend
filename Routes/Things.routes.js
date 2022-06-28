const express =  require("express");
const router = express.Router();


const  ThingController = require('../Controllers/Things.Controller');

//get all the things
router.get('/', ThingController.getAllThings);

//Get by id
router.get('/:id', ThingController.findThingById);

//add the thing
router.post('/post_thing',ThingController.createNewThing);

//delete thing
router.delete('/delete_thing/:id',ThingController.deleteThing);

//update a thing
//router.patch('/update_thing/:id',ThingController.updateThing);


module.exports = router