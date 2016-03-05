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

	organization: -> Organizations.findOne @organizationId

	roleLabels: -> _.chain(findAllRoles @rolesId).map('title').value().join(', ') or '未分配'

	permissions: -> _.chain(findAllRoles @rolesId).map('permissions').flatten().value()

#

Meteor.users.before.update (userId, doc) -> _.omit doc, 'password'

#

Meteor.methods

	'usersUpdate': (id, opt) -> Meteor.users.update id, $set: opt

	'usersRemove': (id) -> Meteor.users.remove id

#

if Meteor.isServer

	Meteor.publish '', ->

		Meteor.users.find {},
			fields:
				services: false

#

findAllRoles = (rolesId) -> Roles.find({ _id: { $in: rolesId or [] } }).fetch()
