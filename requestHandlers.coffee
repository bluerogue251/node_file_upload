formidable = require("formidable")
querystring = require("querystring")
fs = require("fs")

start = (response) ->
  console.log "Request handler 'start' was called"

  body = '<html>'+
  '<head>'+
  '<meta http-equiv="Content-Type" '+
  'content="text/html; charset=UTF-8" />'+
  '</head>'+
  '<body>'+
  '<form action="/upload" enctype="multipart/form-data" '+
  'method="post">'+
  '<input type="file" name="upload">'+
  '<input type="submit" value="Upload file" />'+
  '</form>'+
  '</body>'+
  '</html>'

  response.writeHead(200, {"Content Type": "text/plain"})
  response.write(body)
  response.end()

upload = (response, request) ->
  console.log "Request handler 'upload' was called"
  form = new formidable.IncomingForm()
  console.log "About to parse"
  form.parse request, (error, fields, files) ->
    console.log "Parsing done"
    fs.rename files.upload.path, "/home/teddy/Desktop/test.png", ->
      console.log "Renamed"
    response.writeHead(200, {"Content-Type": "text/html"})
    response.write("Received image: <br/>")
    response.write("<img src='/show' />")
    response.end()

show = (response) ->
  console.log "Request handler 'show' was called"
  response.writeHead(200, {"Content-Type": "image/png"})
  fs.createReadStream("/home/teddy/Desktop/test.png").pipe(response)

exports.start  = start
exports.upload = upload
exports.show   = show

