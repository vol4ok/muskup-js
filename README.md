# MUSKUP-JS

Mustache and coffeekup template to js-code compiler. 

Use twitter's [hogan.js](https://github.com/twitter/hogan.js) engine and [coffeekup](https://github.com/mauricemach/coffeekup).


### Install

`npm install muskup-js`

### Example

```
compile = require('../muskup-js')
compile __dirname+'/template.ck', (err, js) ->
  console.log js
```

### License
MIT License