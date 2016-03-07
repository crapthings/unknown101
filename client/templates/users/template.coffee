_ = lodash

checkedPermissions = []

Template.users.viewmodel

	click: (e, t) ->
		id = ($ e.currentTarget).data 'id'
		password = prompt '用户名'
		if password
			Meteor.call 'usersSetPassword', id, password, (err) ->
				unless err
					console.log yes

#

Template.usersAdd.viewmodel

	events:

		'submit form': (e, t) ->
			do e.preventDefault
			opt = form2js 'usersForm'
			Meteor.call 'usersAdd', opt, (err) ->
				unless err
					Router.go 'users'

#

Template.usersUpdate.viewmodel

	events:

		'submit form': (e, t) ->
			do e.preventDefault
			opt = form2js 'usersForm'
			opt.rolesId = opt.rolesId or []
			Meteor.call 'usersUpdate', @user()._id, opt, (err) ->
				unless err
					Router.go 'users'

#

Template.usersFormRoleItem.viewmodel

	events:

		'change input': (e, t) ->

			unless ($ e.currentTarget).prop 'checked'

				checkedPermissions = _.difference checkedPermissions, t.data.permissions

				_.each t.data.permissions, (p) ->
					($ "input[value=\"#{p}\"]").prop 'checked', false

			($ '.data-rolesId:checked').each (i, e) ->
				checkedPermissions = _.union Roles.findOne(e.value).permissions, checkedPermissions

			_.each checkedPermissions, (p) ->
				($ "input[value=\"#{p}\"]").prop 'checked', true
