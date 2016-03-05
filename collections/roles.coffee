@Roles = new Mongo.Collection 'roles'

# Roles.attachSchema new SimpleSchema

# 	title:
# 		type: String
# 		label: '名称'

# 	# desc:
# 	# 	type: String
# 	# 	label: '摘要'

# 	# permissions:
# 	# 	type: Array
# 	# 	label: '权限'

# 	# 'permissions.$':
# 	# 	type: String

#

Meteor.methods

	'rolesAdd': (opt) -> Roles.insert opt

	'rolesUpdate': (id, opt) -> Roles.update id, $set: opt

	'rolesRemove': (id) -> Roles.remove id
