var forever = require('forever');

var child = new (forever.Monitor)('server.js', {
  max: 3,
  silent: true,
  options: []
});

child.start();