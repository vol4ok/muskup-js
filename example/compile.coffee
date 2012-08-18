compile = require('../muskup-js')

compile __dirname+'/template.ck', (err, js) ->
  console.log js
  console.log '---------------------------'
  compile __dirname+'/template.mu', (err, js) ->
    console.log js
