const express = require('express')
const route = express.Router()
const truncate = require('../util').truncate

route.get('/', (req, res) => {
    fetch('http://localhost:8080/api/news?limit=2')
        .then(
            resp => resp.json())
        .then(
            data => {
                data.forEach((element, index, arr) => {
                    arr[index].content = truncate(element.content, 60)
                });
                res.render('landing', { data: data })
            })
        .catch(err => {
            res.render('error', { data: err })
        })
})

route.get('/menu', (req, res) => {
    fetch('http://localhost:8080/api/menu')
        .then(
            resp => resp.json())
        .then(data => {
            res.render('menu', { data: data })
        })
        .catch(err => {
            res.render('error', { data: err })
        })
})

module.exports = route