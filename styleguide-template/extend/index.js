'use strict';

const hljs = require('highlight.js');

module.exports = function(Handlebars) {
  /** {@link https://stackoverflow.com/a/34252942} */
  Handlebars.registerHelper('ifEquals', function (arg1, arg2, options) {
    return arg1 == arg2 ? options.fn(this) : options.inverse(this);
  });

  Handlebars.registerHelper('hljs', function(value, lang) {
    lang = lang || 'html';
    try {
      return hljs.highlight(lang, value, true).value;
    } catch (e) {
      console.log(e);
    }
  });
};
