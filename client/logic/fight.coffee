define (require, exports) ->
	#skill require
	skill = require('./skill.coffee')
	SkillType = skill.SkillType
	SkillTiming = skill.SkillTiming
	
	class AttackResult
		constructor:(@infoList)->
			@infoList or= []
			@isMissed = false
			@damages = []
			@isDead = false
			
	class Attack extends Backbone.Model
		constructor:(@attackPlayer,@defensePlayer)->
			@attackResult = new AttackResult()
		_skillIterator: (skill)=>skill.action(@attackPlayer,@defensePlayer,@attackResult)
		onAttack:->
			_.any(@attackPlayer.getSkillsByType(SkillType.attack,SkillTiming.onAttack),@_skillIterator)
		onDefense:->
			_.any(@attackPlayer.getSkillsByType(SkillType.defense,SkillTiming.onDefense),@_skillIterator)
		afterDamage:->
			_.any(@attackPlayer.getSkillsByType(SkillType.attack,SkillTiming.afterDamage),@_skillIterator)
			_.any(@defensePlayer.getSkillsByType(SkillType.defense,SkillTiming.afterDamage),@_skillIterator)
		outputInfo:->
			console.log(@attackPlayer.name+@attackPlayer.getHp() + '--'+ info.name+ '--'+ @defensePlayer.name+@defensePlayer.getHp()) for info in @attackResult.infoList
		damage:->
			if not @attackResult.isMissed
				for damage in @attackResult.damages
					@defensePlayer.set({'hp':@defensePlayer.get('hp') - damage.value})
					@attackResult.infoList.push {'name':'damage:'+damage.value,template:''}
			@attackResult.isDead = @defensePlayer.isDead()
		Attack:->
			@onAttack()
			@onDefense()
			@damage()
			@afterDamage()
			@outputInfo()
			return @attackResult
	
	class Fight extends Backbone.Model
		constructor:(@player1,@player2)->
		attack:(attackPlayer,defensePlayer)->
			_attack = new Attack(attackPlayer,defensePlayer)
			_attack.Attack()
		round:->
			@attack(@player1,@player2).isDead or @attack(@player2,@player1).isDead
		output:(player)->
			console.log('@'+player.name + '--' + player.constellation.name + ' win the fight!')
		Begin:->
			isOver = false
			until isOver
				isOver = @round()
			if @player1.isDead()
				@output(@player2)
			if @player2.isDead()
				@output(@player1)

	exports.Attack = Attack
	exports.AttackResult = AttackResult
	exports.Fight = Fight
	exports