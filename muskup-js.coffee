###!
 * Copyright (c) 2012 Andrew Volkov <hello@vol4ok.net>
###

$ = {}
$ extends require 'path'
$ extends require 'fs'
$ extends require 'util'
hogan = require 'hogan.js'
ck = require './coffeekup'

cache = {}

read = (path, options, fn) ->
  ckExt = options.ck ? '.ck'
  str = cache[path]
  return fn(null, str) if (options.cache and str)
  $.readFile path, 'utf8', (err, str) ->
    return fn(err) if (err)
    str = ck.render(str) if $.extname(path) is ckExt
    cache[path] = str if (options.cache)
    fn(null, str)

render = (path, opt, fn) ->
  if typeof opt == "function"
    fn = opt
    opt = {}
  opt.asString = yes unless opt.asString?
  read path, opt, (err, str) ->
    return fn(err) if (err)
    try
      result = hogan.compile(str, opt)
      fn(null, result)            
    catch err
      fn(err)

module.exports = render