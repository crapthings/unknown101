@System = new Mongo.Collection 'system'

unless System.findOne { init: yes }
	System.insert
		init: yes
