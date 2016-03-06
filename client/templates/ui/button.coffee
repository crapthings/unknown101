Template.removeBtn.viewmodel

	text: '删除'

	events:

		click: (e, t) ->

			Meteor.call @method(), Template.parentData(1)._id if confirm '确定删除吗'

Template.removeLink.viewmodel

	text: '删除'

	events:

		click: (e, t) ->

			Meteor.call @method(), Template.parentData(1)._id if confirm '确定删除吗'
