compile = require('../muskup-js')

js = compile __dirname+'/template.ck'
console.log js
console.log '---------------------------'
js = compile __dirname+'/template.mu'
console.log js
