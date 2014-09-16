exec = require("child_process").exec
start = ->
  console.log "Request handler 'start' was called"

  sleep = (milliseconds) ->
    startTime = new Date().getTime()
    continue while new Date().getTime() < startTime + milliseconds

  sleep(10000)

  "Hello start"

upload = ->
  console.log "Request handler 'upload' was called"
  "Hello upload"

exports.start = start
exports.upload = upload
