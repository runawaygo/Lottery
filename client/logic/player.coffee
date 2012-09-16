define (require,exports)->
	Skill = require('./skill.coffee')
	class Player extends Backbone.Model	
		constructor: (personInfo,@constellation)->
			super personInfo
			@power = @get('power')
			@name = @get('name')
			@skills = [new Skill.Hit()]
			@effects = []
			@set {'hp':Math.floor(@power * @constellation.hp),'attack':Math.floor(@power*@constellation.attack)}

	
			if @constellation.isConstellationDate()
				@set {'isConstellationDate':true}
				@constellation.effect(this)
		defaults: ->
		 	{'power':100,'isConstellationDate':false}
		getSkillsByType:(type,timing)->
			skill for skill in @constellation.skills.concat(@skills) when skill.type is type and skill.timing is timing
		status:->
			console.log @name+' : '+@get('hp')
		isDead:->
			if @get('hp') <=0 then true else false
		setHp:(value)->
			value  or= @get('hp')
			@set {'hp':Math.floor(value)}
			this
		getHp:->
			@get('hp')
		addHp:(value)->
			@set {'hp':Math.floor(@get('hp')+value)}
			this
		resetHp:->
			@set {'hp':Math.floor(@power * @constellation.hp)}
		getAttack:->
			@get 'attack'
			
	exports.Player = Player
	exports