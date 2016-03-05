#

_ = lodash

# 12

# Meteor.users.remove {}
# Roles.remove {}
Organizations.remove {}
Patents.remove {}

unless Organizations.findOne { root: true }

	rootId = Organizations.insert
		title: 'root集团'
		init: true
		parentId: 0

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

	# randomize org tree

	# level 1

	_.times 6, ->
		Organizations.insert
			title: _.sample fakeOrgs
			parentId: rootId
		, (err, id) ->

			# level 2

			_.times _.random(3), ->
				Organizations.insert
					title: _.sample fakeOrgs
					parentId: id
				, (err, id) ->

					# level 3

					_.times _.random(5), ->
						Organizations.insert
							title: _.sample fakeOrgs
							parentId: id
						, (err, id) ->

							#  level 4

							_.times _.random(4), ->
								Organizations.insert
									title: _.sample fakeOrgs
									parentId: id
								, (err, id) ->

									#  level 5

									_.times _.random(2), ->
										Organizations.insert
											title: _.sample fakeOrgs
											parentId: id

#

	_.times 200, ->

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
