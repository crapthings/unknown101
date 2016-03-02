Router.configure
	layoutTemplate: 'layout'

Router.onBeforeAction ->
	unless Meteor.userId()
		@layout 'blank'
		@render 'login'
	else
		do @next

