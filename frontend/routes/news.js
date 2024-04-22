const express = require('express')
const route = express.Router()
const truncate = require('../util').truncate

route.get('/archive', (req, res) => {
    fetch('http://localhost:8080/api/news')
        .then(
            resp => resp.json())
        .then(data => {
            data.forEach((element, index, arr) => {
                arr[index].content = truncate(element.content, 100)
            });
            res.render('archive', { data: data })
        })
        .catch(err => {
            res.render('error', { data: err })
        })
})

route.get('/news/:id', (req, res) => {
    fetch('http://localhost:8080/api/news/' + req.params.id)
        .then(
            resp => resp.json())
        .then(data => {
            res.render('news', { data: data })
        })
        .catch(err => {
            res.render('error', { data: err })
        })
})

module.exports = route