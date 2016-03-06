_ = lodash

#

Router.route '/organizations', ->

	Session.set 'search-organization-by-title', undefined

	@render 'organizations',

		data: ->

			root: ->

				kw = Session.get 'search-organization-by-title'

				if kw

					results = Organizations.find({ title: new RegExp kw }).fetch()

					ids = _.chain(results).map('ancestors').flatten().uniq().value()

					console.log JSON.stringify(ids)

					Organizations.findOne { init: true },
						transform: (doc) ->
							console.log doc
							doc.children = ->
								Organizations.find { _id: { $in: ids } }
							return doc

				else

					Organizations.findOne { init: true }

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
