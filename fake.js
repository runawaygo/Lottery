var lt = require('./lottery')

var users = []
var User_Count = 200

for (var i = 0; i < User_Count; i++) {
	users[i] = {
		userId: lt.randomString(4) + '@exmaple.com',
		userNumber: lt.randomInteger(10000)
		salt: lt.randomString(4),
	}
}

exports.users = users