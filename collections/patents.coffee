@Patents = new Mongo.Collection 'patents'

Patents.attachSchema new SimpleSchema

	title:
		type: String
		label: '名称'

	desc:
		type: String
		label: '摘要'

	applicationNo:
		type: String
		label: '申请号'

	applicationDate:
		type: Date
		label: '申请日期'

	applicant:
		type: String
		label: '申请人'

	address:
		type: String
		label: '地址'

	inventor:
		type: String
		label: '发明人'

	_category1:
		type: String
		label: '主分类号'

	_category2:
		type: String
		label: '分类号'

	_publishNo:
		type: String
		label: '公开号'

	_publishDate:
		type: Date
		label: '公开日期'

	agency:
		type: String
		label: '代理机构'

	agent:
		type: String
		label: '代理人'
