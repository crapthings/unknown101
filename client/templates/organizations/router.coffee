#

Router.route '/organizations', ->
	@render 'organizations',
		data: ->
			organizations: do Organizations.find
,
	name: 'organizations'

#

Router.route '/organizations/add', ->
	@render 'organizationsAdd'
,
	name: 'organizationsAdd'
