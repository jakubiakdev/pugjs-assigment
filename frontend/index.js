const express = require('express')
const session = require('express-session')
const app = express()
const port = 3000
app.set('view engine', 'pug')

app.use(express.static('public'))

app.use((err, req, res, next) => {
    res.render('error', { data: err })
})

app.use(session({
    secret: 'supersecretsecretkey',
    resave: false,
    saveUninitialized: false,
    cookie: { secure: false }
}));

app.use(express.urlencoded({ extended: true }))

app.use(require('./routes/main'))
app.use(require('./routes/news'))
app.use(require('./routes/order'))
app.use(require('./routes/cart'))
app.use(require('./routes/admin'))

app.all('*', (req, res) => { 
    res.status(404).render('error', { data: 'Nie znaleziono podanej strony.' })
}); 

module.exports = app


app.listen(port, () => console.log(`Frontend jest dostępny http://localhost:${port}`))