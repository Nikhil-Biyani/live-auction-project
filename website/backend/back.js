const express = require('express');
const mysql = require('mysql');

const app = express();

const db = mysql.createConnection({
  host: 'localhost',
  user: 'Mitul Chadha',
  password: 'your_database_password',
  database: 'Live Auction'
});

db.connect((err) => {
  if (err) throw err;
  console.log('Connected to database!');
});

app.get('/users', (req, res) => {
  db.query('SELECT * FROM users', (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

app.get('/items', (req, res) => {
  db.query('SELECT * FROM items', (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

app.get('/bids', (req, res) => {
  db.query('SELECT * FROM bids', (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

app.post('/users', (req, res) => {
  const { username, pwd, email } = req.body;
  const newUser = { username, pwd, email };
  db.query('INSERT INTO users SET ?', newUser, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

app.put('/items/:id', (req, res) => {
  const { item_name, item_description, start_bid, reserve_price, end_time } = req.body;
  const updatedItem = { item_name, item_description, start_bid, reserve_price, end_time };
  db.query('UPDATE items SET ? WHERE item_id = ?', [updatedItem, req.params.id], (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

app.delete('/bids/:id', (req, res) => {
    const bidId = req.params.id;
    db.query('DELETE FROM bids WHERE bid_id = ?', bidId, (err, result) => {
      if (err) throw err;
      res.send(result);
    });
  });
  
  const PORT = process.env.PORT || 3000;
  
  app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
  });
  