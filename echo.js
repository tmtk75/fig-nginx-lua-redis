var fs = require('fs');
var app = require('http').createServer(function(req, res) {
  res.writeHead(200, {'Content-Type': 'text/html'});
  res.end(JSON.stringify({
    headers: req.headers,
    url: req.url,
  }));
  console.log(req.url);
}).listen(3000);
console.log("litening at 3000");
