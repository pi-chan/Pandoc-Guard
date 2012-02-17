var connect = require('connect');
connect.createServer(
  connect.static(__dirname + '/output')
).listen(10000);
