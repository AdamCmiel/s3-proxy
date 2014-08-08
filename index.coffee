express = require "express"
app = express()
app.all "*", (req, res, next) ->
  res.header "Access-Control-Allow-Origin", "*"
  res.header "Access-Control-Allow-Headers", "X-Requested-With"
  next()
app.get "/", require "./lib/response"

port = process.env.PORT
app.listen port
console.log "Listening on #{port}"
