define (require, exports) ->
	Player = require('./logic/player.coffee').Player
	Fight = require('./logic/fight.coffee').Fight
	require('./FollowingData')
	Constellation = require('./logic/constellation.coffee')
	console.log(Constellation)
	class WorkspaceRouter extends Backbone.Router
		constructor:->
			console.log('WorkspaceRouter constructor')
			$('#pk-container').modal({backdrop:true,keyboard:true})
			super()
		routes:
			'search/:query':'search'
			"help":"help"
			"pk":"pk"
			'me':'me'
			'':'main'
		me:->
			$('#persons-container').hide()
			$('#me-pk-detail-container').hide()
			$('#pk-message-container').hide()
			$('#person-detail-container').hide()
			$('#constellation-detail-container').show()

		main:->
			$('#me-pk-detail-container').hide()
			$('#pk-message-container').hide()

			$('#me-detail-container').hide()
			$('#me-reference-container').hide()	
			$('#pk-message-container').hide()
		
			$('#persons-container').show()
			$('#person-detail-container').show()		
			$('#constellation-detail-container').show()
		
		help: ->
			console.log('help++')
			$('#pk-container').modal('show')
				
		pk: ->
			$('#persons-container').hide()
			$('#me-pk-detail-container').show().css({right:100})
			$('#person-detail-container').show().css({left:100})
			$('#constellation-detail-container').hide()
			$('#pk-message-container').show().css({left:310,right:310,'min-height':500})
		
		search: (query,page)->
			console.log('search'+query)

	show = (persons)->
		$("#personTemplate").tmpl(persons[0...24]).appendTo("#persons-container")
		$('.constellation-panel').twipsy()
		$("#persons-container .person")
			.draggable({ start:(->$(this).addClass('drag')), stop:(->$(this).removeClass('drag'))})
			.each (index)->
				$(this).css { left: parseInt(index / 4) * 80 + 'px', top: index % 4 * 125 + 'px' }
		$("#persons-container .person").click ->
			workspace.navigate('pk',true)

	handle = (data)->
		persons = JSON.parse(data)
		show(persons)
		mock=->
			console.log(Constellation.Libra())
			console.log('superowlf')
			p1 = new Player(persons[3],new Constellation.Libra())
			p2 = new Player(persons[4],new Constellation.Scorpio())
			p3 = new Player(persons[5],new Constellation.Taurus())
			fight = new Fight(p3,p2)
			fight.Begin()
			# fight.round()
	
		mock()
	#	mock() for i in [0...30]

	workspace = new WorkspaceRouter()
	
	$(->	
		$('.info-item').twipsy({})
		$('#begin-btn').click ->
			console.log	'begin fight'
		$('#cancel-btn').click ->
			$('#pk-container').modal('hide')
			workspace.navigate('',true)
		workspace.navigate('',true)
		# $.get '/friends',handle
		handle(window.data)
	)