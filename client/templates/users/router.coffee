#

Router.route '/users', ->
	@render 'users',
		data: ->
			users: do Meteor.users.find
,
	name: 'users'

#

Router.route '/users/add', ->
	@render 'usersAdd'
,
	name: 'usersAdd'
