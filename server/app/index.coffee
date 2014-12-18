#app index
express = require "express"
app = express()
server = require "http"
  .createServer app
require("./routes") app
server.listen 5000, "127.0.0.1", ->
  console.info "start listen on 5000 port"
