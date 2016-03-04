_ = lodash

# Meteor.users.attachSchema new SimpleSchema

# 	username:
# 		type: String
# 		label: '名称'
# 		optional: true

# 	services:
# 		type: Object
# 		optional: true
# 		blackbox: true

Meteor.users.helpers

	organization: ->
		console.log @
		Organizations.findOne @organizationId

	roleLabels: ->

		(_.map Roles.find({ _id: { $in: @rolesId or [] } }).fetch(), 'title').toString() or '未确定'

#

Meteor.users.before.update (userId, doc) -> _.omit doc, 'password'

#

Meteor.methods

	'usersUpdate': (id, opt) ->
		Meteor.users.update id, $set: opt

	'usersRemove': (id) -> Meteor.users.remove id

if Meteor.isServer

	Meteor.methods

		'usersAdd': (opt) -> Accounts.createUser opt

	Meteor.publish '', ->

		Meteor.users.find {},
			fields:
				services: false
