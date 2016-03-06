#

_ = lodash

LTT = Meteor.npmRequire 'list-to-tree'

# 12

# Meteor.users.remove {}
# Roles.remove {}
Organizations.direct.remove {}
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

	_.times 2, ->
		Organizations.insert
			title: _.sample fakeOrgs
			parentId: rootId
			ancestors: [rootId]
		, (err, id) ->

			lv2 = id

			# level 2

			_.times _.random(1, 2), ->
				Organizations.insert
					title: _.sample fakeOrgs
					parentId: lv2
					ancestors: [rootId, lv2]
				, (err, id) ->

					lv3 = id

					# level 3

					_.times _.random(1, 2), ->
						Organizations.insert
							title: _.sample fakeOrgs
							parentId: lv3
							ancestors: [rootId, lv2, lv3]
						, (err, id) ->

							lv4 = id

							#  level 4

							_.times _.random(1, 2), ->
								Organizations.insert
									title: _.sample fakeOrgs
									parentId: lv4
									ancestors: [rootId, lv2, lv3, lv4]
								, (err, id) ->

									lv5 = id

									#  level 5

									_.times _.random(1, 2), ->
										Organizations.insert
											title: _.sample fakeOrgs
											parentId: lv5
											ancestors: [rootId, lv2, lv3, lv4, lv5]

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

	#

	# Meteor.setTimeout ->

	# 	orgs = Organizations.find().fetch()

	# 	ltt = new LTT orgs,
	# 		key_id: '_id'
	# 		key_parent: 'parentId'

	# 	tree = ltt.GetTree()

	# 	console.log JSON.stringify tree, null, 4

	# , 2000
