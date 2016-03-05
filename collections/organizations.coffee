#

@Organizations = new Mongo.Collection 'organizations'

#

Organizations.attachSchema new SimpleSchema

	title:
		type: String
		label: '名称'

	root:
		type: Boolean
		optional: true

	parentId:
		type: String
		optional: true

#

Organizations.helpers

	parent: -> Organizations.findOne @parentId

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
