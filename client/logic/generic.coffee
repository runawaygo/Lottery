define (require,exports)->
	exports.getSpecificDate = (month,date)->
		d = new Date()
		d.setMonth(month-1)
		d.setDate(date)
		return d
	exports