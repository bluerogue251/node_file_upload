http = require("http")

onRequest = (request, response) ->
  console.log "Request received"
  response.writeHead(200, {"Content-Type": "text/plain"})
  response.write("Hello World")
  response.end()

start = ->
  http.createServer(onRequest).listen(8888)
  console.log "Server started"

exports.start = start
