var db = require('./config.js').db;
var _ = require('underscore');
var lotteries = db.collection('lottery');
lotteries.ensureIndex("weiboId");

function callbackWithError(callback){
	return function(err, obj){
		if (err){
			console.error(log);
		}
		callback && callback(obj);
	};
}

exports.createLottery = function(lottery, callback){
	lottery.seeds = [];
	lotteries.insert(lottery, callbackWithError(callback));
};
exports.getLottery = function(weiboId, callback){
	lotteries.findOne({"weiboId":weiboId}, callbackWithError(callback));
};
exports.addSeed = function(weiboId, userName, seed, callback){
	this.getLottery(weiboId, function(lottery){
		var user = _.find(lottery.users, function(u){return u.name == userName;});
		user.seed = seed;
		lotteries.save(lottery, callbackWithError(callback));
	});
};

