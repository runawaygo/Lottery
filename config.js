var mongo = require("mongoskin");
var db_url = exports.db_url = "localhost:27017/lottery";
exports.db = mongo.db(db_url);
