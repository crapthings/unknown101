Template.registerHelper	'getPermissionsLabel', ->
	_.map _permissions, (val, key) -> key

Template.registerHelper	'getPermissionsByLabel', (label) -> _permissions[label]
