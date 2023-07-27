//Enlazar las diferentes vistas con la base de datos y sus respectivas tablas
const express = require('express');
const router = express.Router();

const pool = require('../database');
const { isLoggedIn } = require('../lib/auth');

router.get('/profile', (req, res) => {
  res.render('profile');
});

router.get('/', isLoggedIn, async (req, res) => {
  const productos = await pool.query('SELECT * FROM productos LIMIT 25');
  res.render('links/list', { productos });
});

router.get('/grupo', isLoggedIn, async (req, res) => {
  const productos = await pool.query('SELECT * FROM productos WHERE id IN (26, 27);');
  res.render('links/grupo', { productos });
});

module.exports = router;
