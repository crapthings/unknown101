@Organizations = new Mongo.Collection 'organizations'

Organizations.attachSchema new SimpleSchema

	title:
		type: String
		label: '名称'
