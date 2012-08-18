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

read = (path, options) ->
  ckExt = options.ck ? '.ck'
  str = cache[path]
  return str if (options.cache and str)
  str = $.readFileSync(path, 'utf8')
  str = ck.render(str) if $.extname(path) is ckExt
  cache[path] = str if (options.cache)
  return str

render = (path, opt) ->
  opt ?= {}
  opt.asString = yes unless opt.asString?
  try
    return hogan.compile(read(path, opt), opt)
  catch err
    return null

module.exports = render