define (require,exports)->
	Generic = require('./generic.coffee')
	getSpecificDate = Generic.getSpecificDate
	
	Skill = require('./skill.coffee')
	
	class Constellation
		constructor:(@name,@description,@beginDate,@endDate)->
			@skills = []
		isConstellationDate:->
			@beginDate <= new Date() <= @endDate
		effect:(player)->				
			hp = player.getHp()
			attack = player.getAttack()
			player.set {'hp':Math.floor(hp*1.2), 'attack':Math.floor(attack*1.2)}
	
	class Libra extends Constellation
		constructor:->
			super('天平座', '天平座', getSpecificDate(9,23), getSpecificDate(10,23))
			@skills.unshift new Skill.DoubleAttack()
		hp:6
		attack:0.3

	class Taurus extends Constellation
		constructor:->
			super('金牛座','金牛座', getSpecificDate(4,20), getSpecificDate(5,20))
			@skills.unshift new Skill.SuckBloodAttack()
		hp:2
		attack:0.6

	class Scorpio extends Constellation
		constructor:->
			super('天蝎座','天蝎座', getSpecificDate(10,24), getSpecificDate(11,25))
			@skills.unshift new Skill.PoisonAttack()
		hp:3
		attack:0.6

	exports.Constellation = Constellation
	exports.Libra = Libra
	exports.Taurus = Taurus
	exports.Scorpio = Scorpio
	exports