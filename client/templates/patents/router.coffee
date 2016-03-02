#

Router.route '/patents', ->
	@render 'patents',
		data: ->
			patents: do Patents.find
,
	name: 'patents'

#

Router.route '/patents/add', ->
	@render 'patentsAdd'
,
	name: 'patentsAdd'
