### Users

> 用户

	Users: {

	}


### Roles

> 角色

### Organizations

> 机构组织

	Organizations: {
		title: String,
		parentId: String
	}

### Projects

> 项目

	Projects: {
		title: String,
	}

### Achievements

> 成果

	Achievements: {
		title: String
	}

### Patents

> 专利

	Patents: {
		title: String, // 发明名称
		desc: String, // 摘要
		applicationNo: String, // 申请号
		applicationDate: Date, // 申请日
		applicant: String, // 申请人
		address: String, // 地址
		inventor: String, // 发明（设计）人
		_category1: String, // 主分类号
		_category2: String, // 分类号
		_publishNo: String, // 公开号
		_publishDate: Date, // 公开日
		agency: String, // 专利代理机构
		agent: String, // 代理人
		attachments: Array // 附件（专利文件等）
	}
