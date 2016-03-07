#

_ = lodash

#

Template.organizations.viewmodel

	events:

		'change .method-search': (e, t) ->
			Session.set('search-organization-by-title', e.currentTarget.value)

#

Template.organizationItem.viewmodel

	events:

		'click .method-add-organization': (e, t) ->
			do e.stopPropagation
			title = prompt '机构名称'
			if title
				opt =
					title: title
					parentId: t.data._id
				Meteor.call 'organizationsAdd', opt

		'click .method-add-user': (e, t) ->
			do e.stopPropagation
			username = prompt '用户名'
			if username
				opt =
					username: username
					password: '12345678'
					organizationId: t.data._id
				Meteor.call 'usersAdd', opt
