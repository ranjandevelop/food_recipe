const express = require('express');
const mysql = require('mysql');
const bodyparser = require('body-parser');

// Connect to database
const db = mysql.createConnection({
    host: 'localhost',
    user: 'ranjan',
    password: 'ranjan',
    database: 'food_recipe'
});

db.connect((err) => {
    if (err) throw err;
    console.log('Mysql is connected');
})


// Express App
const app = express();

// listen for request
app.listen(3000);

// register view engine
app.set('view engine', 'ejs');

// Static files
app.use(express.static('public'));

// body paraser
app.use(bodyparser.json());
app.use(bodyparser.urlencoded({
    extended: true
}));


app.get('/index', (req, res) => {
    db.query('SELECT * FROM recipe', (err, recipes) => {
        if (err) {
            throw err;
        } else {
            res.render('index', {
                title: 'Home',
                recipes
            });
        }
    });
});

// Login
app.get('/', (req, res) => {
    res.render('login', {
        title: 'Login'
    });
});

// User login
app.post('/login/submit', (req, res) => {

    const username = req.body.user;
    const password = req.body.password;
    console.log(username, password);
    db.query(`SELECT * FROM user WHERE user_id = '${username}'`, (err, data) => {
        if (err) {
            throw err;
        } else {
            if (data[0].user_id === username) {
                if (data[0].password === password) {
                    res.redirect('/index');
                }
            } else {
                res.send('error');
            }
            console.log(data[0].user_id, data[0].password);
        }
    });

});



// Details Page
app.get('/recipe/:id', (req, res) => {
    const id = req.params.id;
    console.log(id);
    db.query(`SELECT user.name AS author, recipe.name, recipe.image_url, ingredients.items, ingredients.unit, ingredients.amount, process.steps FROM user, recipe, ingredients,process 
            WHERE recipe.id = process.recipe_id 
            AND recipe.id = ingredients.recipe_id
            AND recipe.creator_id = user.id 
            AND recipe.id = ${id}`,
        (err, details) => {
            if (err) {
                throw err;
            } else {
                console.log(details)
                res.render('detail', {
                    title: 'Details',
                    details
                });
            }
        });
});



// 404 page
app.use((req, res) => {
    res.status(404).render('404', {
        title: '404'
    });
});