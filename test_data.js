var mongo = require('./mongo');

mongo.createLottery({
	weiboId: "3255645724", 
	users:[
		{name: "abc", seed: 243}, 
		{name: "asd", seed: 7432}, 
		{name: "sfsog", seed: 0}
	]
});
mongo.createLottery({
	weiboId: "14532463", 
	users:[
		{name: "adsg", seed: 243}, 
		{name: "h5t", seed: 7432}, 
		{name: "jtyj", seed: 0}
	]
});
mongo.createLottery({
	weiboId: "256457534", 
	users:[
		{name: "ttr", seed: 243}, 
		{name: "jhr", seed: 7432}, 
		{name: "uyyk", seed: 0}
	]
});
mongo.createLottery({
	weiboId: "645743734", 
	users:[
		{name: "jyk6", seed: 243}, 
		{name: "vrej", seed: 7432}, 
		{name: "ki8", seed: 0}
	]
});
mongo.createLottery({
	weiboId: "235643545", 
	users:[
		{name: "rtrv", seed: 243}, 
		{name: "tymyt", seed: 7432}, 
		{name: "g43th", seed: 0}
	]
});
mongo.createLottery({
	weiboId: "4573875697875", 
	users:[
		{name: "werg", seed: 243}, 
		{name: "ashfjjd", seed: 7432}, 
		{name: "tkikjh", seed: 0}
	]
});

mongo.addSeed("3255645724", "sfsog", 1312);
