#

_ = lodash

#

# Meteor.users.remove {}
# Roles.remove {}
# Organizations.remove {}
Patents.remove {}

# feed dummy data when server fully started

Meteor.startup ->

	unless Meteor.users.findOne { username: 'admin' }
		Accounts.createUser
			username: 'admin'
			password: 'admin'

	unless Meteor.users.findOne { username: 'demo' }
		Accounts.createUser
			username: 'demo'
			password: 'demo'

	unless Organizations.findOne { title: '集团1' }

		Organizations.insert
			title: '集团1'

	_.times 50, ->
		Patents.insert
			title: do Random.id
			desc: do Random.id
			applicationNo: do Random.id
			applicationDate: new Date()
			applicant: do Random.id
			address: do Random.id
			inventor: do Random.id
			_category1: do Random.id
			_category2: do Random.id
			_publishNo: do Random.id
			_publishDate: new Date()
			agency: do Random.id
			agent: do Random.id
