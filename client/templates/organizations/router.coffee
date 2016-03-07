_ = lodash

#

Router.route '/organizations', ->

	console.log Meteor.user()?.organizationId

	Session.set 'search-organization-by-title', undefined

	@render 'organizations',

		data: ->

			root: ->

				orgId = Meteor.user()?.organizationId

				Organizations.findOne { _id: orgId }

				# kw = Session.get 'search-organization-by-title'

				# if kw

				# 	ids = _.chain(Organizations.find({ title: new RegExp kw }).fetch()).map('_id').flatten().uniq().value()

				# 	ancestors = _.chain(results).map('ancestors').flatten().uniq().value()

				# 	results = _.union ids, ancestors

				# 	console.log results

				# 	Organizations.findOne { init: true },
				# 		transform: (root) ->
				# 			root.children = ->
				# 				Organizations.find { _id: { $in: results } },
				# 					transform: (doc) -> doc
				# 			return root

				# else

				# 	Organizations.findOne { init: true, _id: Meteor.user().organizationId }

,
	name: 'organizations'

#

Router.route '/organizations/add', ->
	@render 'organizationsAdd'
,
	name: 'organizationsAdd'

#

Router.route '/organizations/update/:_id', ->
	@render 'organizationsUpdate',
		data: -> Organizations.findOne @params._id
,
	name: 'organizationsUpdate'
