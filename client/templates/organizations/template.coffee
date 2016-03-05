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
