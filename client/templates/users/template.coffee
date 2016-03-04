_ = lodash

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
