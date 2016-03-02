@Organizations = new Mongo.Collection 'organizations'

Organizations.attachSchema new SimpleSchema

	name:
		type: String
		label: '名称'
