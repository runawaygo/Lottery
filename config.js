var mongo = require("mongoskin");
var db_url = exports.db_url = "";
exports.db = mongo.db(db_url);
