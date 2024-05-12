const express = require('express')
const app = express()
const port = 8080
const bodyParser = require('body-parser')
const fs = require('fs')

const mysql = require('mysql')

let db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    multipleStatements: true // allow for reading schema
});

app.use(bodyParser.urlencoded({ extended: false }))
app.use(express.json())

const dbname = 'jkkuchnia'

new Promise((resolve, reject) => {
    db.query(`SHOW DATABASES LIKE "${dbname}"`, (err, results) => {
        if (err) {
            console.log(err)
            throw err
        }
        if (results.length > 0) {
            console.log("Baza danych wykryta")
            resolve()
        } else {
            console.log("Baza danych nie istnieje, tworzenie")
            db.query(`CREATE DATABASE ${dbname}; USE ${dbname};`, (err) => {
                if (err) {
                    console.log(err)
                    reject(err)
                } else {
                    const schema = fs.readFileSync('schema.sql').toString()
                    db.query(schema, (err) => {
                        if (err) {
                            console.log(err)
                            reject(err)
                        } else {
                            resolve()
                        }
                    })
                }
            })
        }
    })
}).then(() => {
    db.end() // Reconnect to the database without multiple statements and with a database ready
    db = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '',
        database: dbname,
    });

    app.get('/api/menu', (req, res) => {
        db.query('SELECT * FROM menu', (err, data) => {
            return res.json(data)
        })
    })

    app.get('/api/menu/:id', (req, res) => {
        db.query('SELECT * FROM menu WHERE id = ' + req.params.id, (err, data) => {
            return res.json(data[0])
        })
    })

    app.get('/api/news', (req, res) => {
        let limit = ""
        if (req.query.limit) {
            limit = `LIMIT ${req.query.limit}`
        }
        db.query('SELECT * FROM news ORDER BY date ' + limit, (err, data) => {
            return res.json(data)
        })
    })

    app.get('/api/news/:id', (req, res) => {
        db.query('SELECT * FROM news where id = ' + req.params.id, (err, data) => {
            if(err || data.length == 0) {
                return res.status(500).send()
            }
            return res.json(data[0])
        })
    })

    app.post('/api/orders/new', (req, res) => {
        db.query(`INSERT INTO orders (address) VALUES ('${req.body.address}')`, (err, data) => {
            if (err) {
                console.log(err)
                return res.status(500).send()
            }
            req.body.items.forEach(element => {
                db.query(`INSERT INTO ordered_items (order_id, menu_id) VALUES (${data.insertId}, '${element}')`, (err, data) => {
                    if (err) {
                        console.log(err)
                        return res.status(500).send()
                    }
                })
            });
            res.json({ id: data.insertId })
        })
    })

    app.get('/api/orders/:id', (req, res) => {
        db.query(`SELECT * FROM orders WHERE id = ${req.params.id}`, (err, data) => {
            if (err) {
                console.log(err)
                return res.status(500).send()
            }
            db.query(`SELECT name, menu.price FROM ordered_items join menu on ordered_items.menu_id = menu.id WHERE order_id = ${req.params.id}`, (err, items) => {
                if (err || items.length == 0) {
                    console.log(err)
                    return res.status(500).send()
                } else {
                    data[0].items = items
                    res.json(data[0])
                }
            })
        })
    })

    app.post('/api/orders/:id/status', (req, res) => {
        db.query(`UPDATE orders SET status = ${db.escape(req.body.status)} WHERE id = ${req.params.id}`, (err, data) => {
            if (err) {
                console.log(err)
                return res.status(500).send()
            }
            res.status(200).send()
        })
    })

    app.get('/api/orders', (req, res) => {
        db.query(`SELECT * FROM orders WHERE orders.status != "Dostarczone"`, (err, data) => {
            if (err) {
                console.log(err)
                return res.status(500).send()
            }
            const promises = data.map(async (element) => {
                const items = await getItems(element.id);
                element.items = items;
                return element;
            });

            Promise.all(promises)
                .then((updatedOrders) => {
                    res.json(updatedOrders);
                })
                .catch((err) => {
                    console.log(err);
                    res.status(500).send();
                });
        })

        function getItems(orderId) {
            return new Promise((resolve, reject) => {
                db.query(`SELECT name, menu.price FROM ordered_items join menu on ordered_items.menu_id = menu.id WHERE order_id = ${orderId}`, (err, items) => {
                    if (err) return reject(err);
                    resolve(items);
                });
            });
        }
        
    })

    app.listen(port, () => console.log(`Backend jest dostępny http://localhost:${port}`))
})
