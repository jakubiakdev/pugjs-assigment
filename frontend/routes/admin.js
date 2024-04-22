const express = require('express')
const route = express.Router()

route.get('/login', (req, res) => {
    res.render('login')
})

route.post('/login', (req, res) => {
    if(req.body.login == undefined || req.body.password == undefined) {
        res.render('login', {error: 'Brak danych'})
        return
    }
    if(req.body.login == 'admin' && req.body.password == 'admin') {
        req.session.logged = true
        res.redirect('/admin')
    } else {
        res.render('login', {error: 'Błędne dane'})
    }
})

route.get('/admin', (req, res) => {
    if(!req.session.logged) {
        res.redirect('/login')
        return
    }
    fetch('http://localhost:8080/api/orders')
    .then(resp => resp.json())
    .then(data => {
        res.render('admin', {data: data})
    })
    .catch(err => {
        res.render('error', { data: err })
    })
})

route.post('/admin', (req, res) => {
    if(!req.session.logged) {
        res.redirect('/login')
        return
    }
    if(req.body.doreczenie != undefined) {
        fetch(`http://localhost:8080/api/orders/${req.body.doreczenie}/status`, {
            method: 'POST',
            body: JSON.stringify({status: 'W doręczeniu'}),
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then(data => {
            res.redirect('/admin')
        })
        .catch(err => {
            res.render('error', { data: err })
        })
    }
    if(req.body.dostarczenie != undefined) {
        fetch(`http://localhost:8080/api/orders/${req.body.dostarczenie}/status`, {
            method: 'POST',
            body: JSON.stringify({status: 'Dostarczone'}),
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then(data => {
            res.redirect('/admin')
        })
        .catch(err => {
            res.render('error', { data: err })
        })
    }
})

module.exports = route