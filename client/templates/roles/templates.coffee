_ = lodash

#

Template.rolesAdd.viewmodel

	events:

		'submit form': (e, t) ->
			do e.preventDefault
			opt = form2js 'rolesForm'
			Meteor.call 'rolesAdd', opt, (err) ->
				unless err
					Router.go 'roles'

#

Template.rolesUpdate.viewmodel

	events:

		'submit form': (e, t) ->
			do e.preventDefault
			opt = form2js 'rolesForm'
			opt.permissions = opt.permissions or []
			Meteor.call 'rolesUpdate', @_id(), opt, (err) ->
				unless err
					Router.go 'roles'

#

Template.permissions.viewmodel

	onRendered: ->
		_.each @permissions && @permissions(), (p) ->
			($ "[value=\"#{p}\"]").attr 'checked', 'checked'
