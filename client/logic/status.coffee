define (require,exports)->
	class Status
		constructor:(@name,@description,@timing)->
		action:(player)->
	
	class ConstellationDate extends Status
		constructor:(@player)->
			super '本星之月','本星之月',''
		effect:->
			hp = @player.getHp()
			attack = @player.getAttack()
			@player.set {'hp':Math.floor(hp*1.2), 'attack':Math.floor(attack*1.2)}
	exports.Status = Status
	exports.ConstellationDate = ConstellationDate
	exports