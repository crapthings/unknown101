@Patents = new Mongo.Collection 'patents'

Patents.attachSchema new SimpleSchema

	title:
		type: String

	desc:
		type: String

	applicationNo:
		type: String

	applicationDate:
		type: Date

	applicant:
		type: String

	address:
		type: String

	inventor:
		type: String

	_category1:
		type: String

	_category2:
		type: String

	_publishNo:
		type: String

	_publishDate:
		type: Date

	agency:
		type: String

	agent:
		type: String
