//var db = require('./config').db;
var express = require('express'),
	app = express();


var SinaWeibo = require('node-sina-weibo');
var https = require('https');

var clientId = '969200639';
var clientSecret = '9d00536a5ef653c2ff549e47ade7f06a';

var weibo = new SinaWeibo(clientId, clientSecret);

app.use(express.logger({ format: ':method :url :status' }));
app.use(express.bodyParser());
app.use(express.cookieParser());
app.use(express.session({ secret: 'superwolf' }));
app.use(app.router);
app.set('view engine', 'jade')


app.use(express.errorHandler({ dumpExceptions: true, showStack: true }));
app.use('/',express.static(__dirname + '/',{ cache:false}));

app.get('/login',function(req,res){
	var url = weibo.getAuthorizeUrl({
    redirect_uri:'http://leto.com:8000/callback',
    response_type:'code'
	});
	res.redirect(url);
});

app.get('/callback',function(req,res){
	console.log(req.query['code']);
	var code = req.query['code'];
	weibo.getAccessToken({
	        code: code,
	        grant_type:'authorization_code',
	        redirect_uri:'http://leto.com:8000/callback'
	    }, function (err, result, accessToken) {
	        if (err) return console.log(err);
	        console.log(accessToken);
	  			res.cookie('accessToken',accessToken);
	  			res.redirect('/client/index.html');
	    }
	);
});

app.get('/weibo',function(req,res){
	var accessToken = req.cookies['accessToken'];
	var weibo = new SinaWeibo(clientId, clientSecret, accessToken);
	weibo.GET('statuses/public_timeline',{}, function (err, resultInJson, response) {
	    if (err) return callback(err);
	    // do something with resultInJson
	    res.end(JSON.stringify(resultInJson));
	});
});

app.get('/comment',function(req,res){
	var accessToken = req.cookies['accessToken'];
	var weiboId = req.query['weiboId'];
	var weibo = new SinaWeibo(clientId, clientSecret, accessToken);
	weibo.GET('comments/show',{id:weiboId}, function (err, resultInJson, response) {
	    if (err) return callback(err);
	    // do something with resultInJson
	    res.end(JSON.stringify(resultInJson));
	});
});


app.get('/comment',function(req,res){
	var accessToken = req.cookies['accessToken'];
	var weiboId = req.query['weiboId'];
	var weibo = new SinaWeibo(clientId, clientSecret, accessToken);
	weibo.GET('comments/show',{id:weiboId}, function (err, resultInJson, response) {
	    if (err) return callback(err);
	    // do something with resultInJson
	    res.end(JSON.stringify(resultInJson));
	});
});

var data = require('./fake')
app.get('/test/:id', function(req, res){
	if (Date.now() > data.) {
	res.render('test', {users:.users})
})

var port = process.env.PORT || 8000;
console.log("service run on " + port);

app.listen(port);

