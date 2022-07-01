const express = require('express');
const router = express.Router()

const commerceController = require('../Controllers/Commerce.Controller')

//get all the things
router.get('/product',commerceController.getAllProduct)


//get all client

router.get('/temps',commerceController.getAllTemps)

//get faits
router.get('/faits',commerceController.getAllFaits)

//get csv
router.get('/csv',commerceController.getAllCsv)

module.exports = router