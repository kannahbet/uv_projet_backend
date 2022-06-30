const express = require('express');
const router = express.Router()

const commerceController = require('../Controllers/Commerce.Controller')

//get all the things
router.get('/product',commerceController.getAllProduct)

//get all client

router.get('/users',commerceController.getAllUsers)

//get all client

router.get('/temps',commerceController.getAllTemps)
module.exports = router