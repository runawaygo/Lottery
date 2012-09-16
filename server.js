//var db = require('./config').db;
var express = require('express'),
	app = express();

app.use(express.logger({ format: ':method :url :status' }));
app.use(express.bodyParser());
app.use(express.cookieParser());
app.use(express.session({ secret: 'bang590' }));
app.use(app.router);

app.use(express.errorHandler({ dumpExceptions: true, showStack: true }));
app.use('/',express.static(__dirname + '/',{ cache:false}));

app.get('/event/:id', function(req, res){
	res.render('test')
})

var port = process.env.PORT || 8000;
console.log("service run on " + port);

app.listen(port);

