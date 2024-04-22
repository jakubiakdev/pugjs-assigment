const express = require('express')
const route = express.Router()

route.get('/order/:id', (req, res) => {
    if(req.params.id == undefined) {
        res.redirect('/cart')
        return
    }
    fetch('http://localhost:8080/api/orders/' + req.params.id)
    .then(resp => resp.json())
    .then(data => {
        res.render('order', {data: data})
    })
    .catch(err => {
        res.render('error', { data: err })
    })
})

module.exports = route