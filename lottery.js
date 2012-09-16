'use strict'

var crypto = require('crypto')
var algorithm = 'sha1'

function randomInteger(min, max) {
	if (arguments.length === 1) {
		max = min
		min = 0
	}
	return Math.floor(Math.random() * (max - min) + min)
}

function randomString(len) {
	if (!(len >= 1)) len = 1
	return Math.random().toString(36).slice(2, len + 2)
}

function secret(userId, userNumber, salt) {
	var shasum = crypto.createHash(algorithm)
	shasum.update(userId)
	shasum.update(':')
	shasum.update(String(userNumber))
	shasum.update(':')
	shasum.update(salt)
	return {
		owner: userId,
		salt: salt,
		digest: shasum.digest('hex')
	}
}

/*
/*
console.log(randomInteger(10))
console.log(randomInteger(10))
console.log(randomInteger(10))

console.log(randomInteger(10))
console.log(randomInteger(10))
console.log(randomInteger(10))

console.log(randomString())
console.log(randomString())
console.log(randomString())

console.log(
secret('johnhax@gmail.com', 1000, randomString())
)

console.log(
secret('测试', 1000, randomString())
)

console.log(
secret('测试', 1000, randomString())
)*/


exports.secret = secret
exports.randomInteger = randomInteger
exports.randomString = randomString