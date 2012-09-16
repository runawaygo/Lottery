define (require,exports)->
	SkillType = 
		attack: 'attack'
		defense: 'defense'

	SkillTiming = 
		afterDamage:'afterDamage'
		onAttack:'onAttack'
		onDefense:'onDefense'
	
	DamageType = 
		hit: 'hit'
		poison: 'poison'
		double: 'double'
	
	RoundMessageType = 
		miss: 
			name:'miss'
			template:'miss'
		poisonAttack:
			name:'poisonAttack'
			template:'poisonAttack'
		doubleAttack:
			name:'doubleAttack'
			template:'doubleAttack'
		hit:
			name:'hit'
			template:'hit'
		suckBlood:
			name:'suckBlood'
			template:'suckBlood'

	class Damage
		constructor:(@value,@type)->

	class Skill
		constructor: (@name,@description,@type,@timing)->
		action:(attackPlayer,defensePlayer,attackResult)->
		rate:1
		check:->Math.random()<=@rate
	
	class AttackSkill extends Skill
		constructor: (@name,@description,@timing)->
			super(@name,@description, SkillType.attack,@timing)
		
	class DefenseSkill extends Skill
		constructor: (@name,@description,@timing)->
			super(@name,@description, SkillType.defense,@timing)

	class Hit extends AttackSkill
		constructor: ->
			super('Hit','Normal hit',SkillTiming.onAttack)
		action:(attackPlayer,defensePlayer,attackResult)->
			if @check()
				attackValue = attackPlayer.get('attack')
				attackResult.damages.push(new Damage(attackValue,'hit'))
				attackResult.infoList.push RoundMessageType.hit
				return true
			else false
	
	class DoubleAttack extends AttackSkill
		constructor: ->
			super('Double','Double hit',SkillTiming.onAttack)
		action:(attackPlayer,defensePlayer,attackResult)->
			if @check()
				attackValue = attackPlayer.get('attack')
				attackResult.damages.push(new Damage(attackValue * 2,'double'))
				attackResult.infoList.push RoundMessageType.doubleAttack
				return true
			else false
		rate:0.2
	
		
	class PoisonAttack extends AttackSkill
		constructor: ->
			super('Poison','Poison hit',SkillTiming.onAttack)
		action:(attackPlayer,defensePlayer,attackResult)->
			if @check()
				attackValue = attackPlayer.get('attack')
				attackResult.damages.push(new Damage(attackValue,'hit'))
				attackResult.damages.push(new Damage(Math.floor(attackValue/3),'poison'))
				attackResult.infoList.push RoundMessageType.poisonAttack
				return true
			else false
		rate:0.2

	class SuckBloodAttack extends AttackSkill
		constructor:->
			super('SuckBlood','SuckBlood hit',SkillTiming.afterDamage)
		action:(attackPlayer,defensePlayer,attackResult)->
			if not attackResult.isMissed
				attackPlayer.addHp(Math.floor(attackResult.damages[0].value*0.2))
				attackResult.infoList.push RoundMessageType.suckBlood
			false
	
	class Dodge extends DefenseSkill
		constructor:->
			super('Dodge','Dodge attack',SkillTiming.onDefense)
		rate:0.2
		action:(attackPlayer,defensePlayer,attackResult)->
			if @check()
				attack.isMissed = true
				attack.infoList.push RoundMessageType.miss
				return true
			else false
	exports.SkillType = SkillType
	exports.SkillTiming = SkillTiming
	exports.DamageType =DamageType
	exports.RoundMessageType = RoundMessageType
	exports.Damage = Damage
	exports.Skill = Skill
	exports.AttackSkill = AttackSkill
	exports.DefenseSkill = DefenseSkill
	exports.Hit = Hit
	exports.DoubleAttack = DoubleAttack
	exports.PoisonAttack = PoisonAttack
	exports.SuckBloodAttack = SuckBloodAttack
	exports.Dodge = Dodge
	exports