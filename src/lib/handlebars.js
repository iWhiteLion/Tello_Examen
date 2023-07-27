const Handlebars = require('handlebars');


const helpers = {};


//Herramienta para imprimir de forma correcta las listas de utiles
Handlebars.registerHelper('nl2br', function (text) {
  const escapedText = Handlebars.Utils.escapeExpression(text);
  return new Handlebars.SafeString(escapedText.replace(/(\r\n|\n|\r)/g, '<br>'));
});

module.exports = helpers;