_ = lodash

Template.organizations.viewmodel

	events:

		'click .method-add': (e, t) ->
			do e.stopPropagation
			title = prompt '机构名称'
			if title
				opt =
					title: title
					parentId: t.data._tree()._id
				Meteor.call 'organizationsAdd', opt

		'change .method-search': (e, t) ->
			Session.set('search-organization-by-title', e.currentTarget.value)

Template.organizationItem.viewmodel

	events:

		'click .method-add': (e, t) ->
			do e.stopPropagation
			title = prompt '机构名称'
			if title
				opt =
					title: title
					parentId: t.data._id
				Meteor.call 'organizationsAdd', opt
