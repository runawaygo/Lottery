define (require, exports) ->
	require('./FollowingData')
	persons = []
	$(->
		$.getJSON('/user_timeline',(data)->
			console.log(data)
			console.log $("#weiboTemplate")
			console.log $("#weiboTemplate").tmpl(data.statuses[0])
			$("#weiboTemplate").tmpl(data.statuses[0...12]).appendTo("#weibos-container")	

			$("#weibos-container .weibo")
				.draggable({ start:(->$(this).addClass('drag')), stop:(->$(this).removeClass('drag'))})
				.each((index)->
					$(this).css { left: 0, top: index * 150 + 'px' }
				)
				.click((event)->
					$('.weibo').hide()
					$(this).show()
				
					ps = JSON.parse(window.data)
					persons = ps[0...24]
					for person in persons
						person.number = Math.floor(Math.random()*200)

					$("#persons-container").html("")
					$("#personTemplate").tmpl(persons).appendTo("#persons-container")
					$("#persons-container .person")
						.each (index)->
							$(this).css { left: parseInt(index / 4) * 80 + 'px', top: index % 4 * 125 + 'px' }
				)
		)

		$('#roll').click((event)->
			count = 0 
			for person in persons
				count += person.number

			count *= 123
			console.log(count)
			result = count%24

			$($("#persons-container .person")[result]).addClass("hover")
			alert(result+1)
		)
	)