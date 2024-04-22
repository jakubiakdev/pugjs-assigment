const express = require('express')
const route = express.Router()

route.get('/cart', (req, res) => {
    if(req.query.order != undefined) {
        if(req.session.cart == undefined || req.session.cart.length == 0 || req.query.address == undefined) {
            res.redirect('/cart')
            return
        }
        if(req.query.address == '') {
            res.redirect('/cart?noaddress=true')
            return
        }
        fetch('http://localhost:8080/api/orders/new', {
            method: 'POST',
            body: JSON.stringify({items: req.session.cart, address: req.query.address}),
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then(resp => resp.json())
        .then(data => {
            res.redirect('/order/' + data.id)
        })
        .catch(err => {
            res.render('error', { data: err })
        })
        req.session.cart = []
        return
    }
    req.session.cart = req.session.cart || []
    if(req.query.delete != undefined) {
        req.session.cart = req.session.cart.filter(element => element != req.query.delete)
    }
    if(req.query.item) {
        req.session.cart.push(req.query.item)
    }
    const itemPromises = req.session.cart.map(element => {
        return fetch('http://localhost:8080/api/menu/' + element)
        .then(resp => resp.json())
    })
    Promise.all(itemPromises).then((data) => {
        data.noaddress = req.query.noaddress
        res.render('cart', {data: data})
    })
})

module.exports = route