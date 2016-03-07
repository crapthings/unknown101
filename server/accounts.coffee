# 设置创建用户时候接受的字段

Accounts.onCreateUser (opt, user) ->

	user['rolesId'] = opt.rolesId or []

	user['organizationId'] = opt.organizationId if opt.organizationId

	return user

#

Meteor.methods

	'usersAdd': (opt) -> Accounts.createUser opt
