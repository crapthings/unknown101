#

Router.route '/roles', ->
	@render 'roles',
		data: ->
			roles: Roles.find {}
,
	name: 'roles'

#

Router.route '/roles/add', ->
	@render 'rolesAdd'
,
	name: 'rolesAdd'

#

Router.route '/roles/update/:_id', ->
	@render 'rolesUpdate',
		data: -> Roles.findOne @params._id
,
	name: 'rolesUpdate'
