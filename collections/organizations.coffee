#

@Organizations = new Mongo.Collection 'organizations'

#

Organizations.attachSchema new SimpleSchema

	title:
		type: String
		label: '名称'

#

Meteor.methods

	'organizationsAdd': (opt) -> Organizations.insert opt

	'organizationsUpdate': (id, opt) -> Organizations.update id, $set: opt

	'organizationsRemove': (id) -> Organizations.remove id
