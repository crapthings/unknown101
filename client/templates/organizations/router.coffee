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

#

Router.route '/organizations/update/:_id', ->
	@render 'organizationsUpdate',
		data: -> Organizations.findOne @params._id
,
	name: 'organizationsUpdate'
