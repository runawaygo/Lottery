define (require, exports) ->
	require('./FollowingData')
	$(->	
		persons = JSON.parse(window.data)
		$("#personTemplate").tmpl(persons[0...24]).appendTo("#persons-container")
		$("#persons-container .person")
			.draggable({ start:(->$(this).addClass('drag')), stop:(->$(this).removeClass('drag'))})
			.each (index)->
				$(this).css { left: parseInt(index / 4) * 80 + 'px', top: index % 4 * 125 + 'px' }
	)