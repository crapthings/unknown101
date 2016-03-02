Template.login.events
	'submit form': (e, t) ->
		do e.preventDefault
		$username = do ($ t.find '[name="username"]').val
		$password = do ($ t.find '[name="password"]').val
		Meteor.loginWithPassword $username, $password, (err) ->
			unless err
				Router.go 'home'
