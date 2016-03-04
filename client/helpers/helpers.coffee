_ = lodash

#

Template.registerHelper	'getPermissionsLabel', ->
	_.map _permissions, (val, key) -> key

Template.registerHelper	'getPermissionsByLabel', (label) -> _permissions[label]

# decide whether checkbox should be checked

Template.registerHelper 'includes', (a, b) -> _.includes a, b
