_ = lodash

#######################
# global form helpers #
#######################

# decide whether checkbox should be checked

Template.registerHelper 'includes', (a, b) -> _.includes a, b

# handle form option

Template.registerHelper 'setSelected', (a, b) -> a is b

###################
# map permissions #
###################

Template.registerHelper	'getPermissionsLabel', -> _.map _permissions, (val, key) -> key

Template.registerHelper	'getPermissionsByLabel', (label) -> _permissions[label]
