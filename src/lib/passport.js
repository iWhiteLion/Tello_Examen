const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;

const pool = require('../database');
const helpers = require('./helpers');

passport.use('local.signin', new LocalStrategy({
  usuarioField: 'usuario',
  contraField: 'contra',
  passReqToCallback: true
}, async (req, usuario, contra, done) => {
  const rows = await pool.query('SELECT * FROM users WHERE usuario = ?', [usuario]);
  if (rows.length > 0) {
    const user = rows[0];
    const validcontra = await helpers.matchPassword(contra, user.contra)
    if (validcontra) {
      done(null, user, req.flash('success', 'Bienvenido! ' + user.usuario));
    } else {
      done(null, false, req.flash('message', 'Contraseña incorrecta'));
    }
  } else {
    return done(null, false, req.flash('message', 'El usuario no existe!.'));
  }
}));

passport.use('local.signup', new LocalStrategy({
  usuarioField: 'usuario',
  contraField: 'contra',
  passReqToCallback: true
}, async (req, usuario, contra, done) => {

  const { nombre } = req.body;
  let newUser = {
    nombre,
    usuario,
    contra
  };
  console.log(newUser);
  newUser.contra = await helpers.encryptPassword(contra);
  // Saving in the Database
  const result = await pool.query('INSERT INTO users SET ? ', newUser);
  newUser.id = result.insertId;
  return done(null, newUser);
}));

passport.serializeUser((user, done) => {
  done(null, user.id);
});

passport.deserializeUser(async (id, done) => {
  const rows = await pool.query('SELECT * FROM users WHERE id = ?', [id]);
  done(null, rows[0]);
});

