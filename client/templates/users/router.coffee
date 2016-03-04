#

Router.route '/users', ->
	@render 'users',
		data: ->
			users: ->
				Meteor.users.find {}
,
	name: 'users'

#

Router.route '/users/add', ->
	@render 'usersAdd',
		data: ->
			organizations: ->
				Organizations.find {}

			roles: ->
				Roles.find {}
,
	name: 'usersAdd'

#

Router.route '/users/update/:_id', ->
	@render 'usersUpdate',
		data: ->

			user: =>
				Meteor.users.findOne @params._id

			organizations: ->
				Organizations.find {}

			roles: ->
				Roles.find {}
,
	name: 'usersUpdate'
