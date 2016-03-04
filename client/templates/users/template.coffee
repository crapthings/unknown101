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
			console.log opt.rolesId
			Meteor.call 'usersUpdate', @user()._id, opt, (err) ->
				unless err
					Router.go 'users'

# this might a viewmodel bug so we don't use viewmodel's onRendered
# because it can't find parentData

# Template.roleItem.onRendered ->

# 	user = Template.parentData()?.user()

# 	console.log Template.parentData

# 	if user

# 		roleItem = ($ @find 'input')

# 		rolesId = Template.parentData()?.user().rolesId or []

# 		if _.includes rolesId, roleItem.val()

# 			roleItem.prop 'checked', true
