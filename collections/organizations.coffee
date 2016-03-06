#

_ = lodash

#

@Organizations = new Mongo.Collection 'organizations'

#

Organizations.attachSchema new SimpleSchema

	title:
		type: String
		label: '名称'

	init:
		type: Boolean
		optional: true

	parentId:
		type: String
		index: true

	ancestors:
		type: Array
		optional: true

	'ancestors.$':
		type: String

#

Organizations.helpers

	parent: -> Organizations.findOne @parentId

	children: -> Organizations.find { parentId: @_id }

#

Organizations.before.remove (userId, doc) -> no if Organizations.findOne { parentId: doc._id }

#

Meteor.methods

	'organizationsAdd': (opt) -> Organizations.insert opt

	'organizationsUpdate': (id, opt) -> Organizations.update id, $set: opt

	'organizationsRemove': (id) -> Organizations.remove id

#

# if Meteor.isServer

	#

	# Meteor.startup ->

	# 	unless Organizations.findOne { root: true }

	# 		Organizations.insert
	# 			title: '集团'
	# 			root: true
