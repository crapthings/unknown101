# router config

Router.configure
	layoutTemplate: 'layout'

# handle server down in production

# Router.onBeforeAction ->
# 	unless Meteor.status().connected
# 		@layout 'blank'
# 		@render 'serverdown'
# 	else
# 		do @next

# 未登录

Router.onBeforeAction ->
	unless Meteor.userId()
		@layout 'blank'
		@render 'login'
	else
		do @next
