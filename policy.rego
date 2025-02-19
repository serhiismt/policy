package example

import future.keywords.in

roles contains role.id if {
    some org in input.user.organizations
    org.id == input.resource.organization_id
    some role in org.roles
}

permissions contains permission if {
    some role in data.roles
    role.id in roles
    some permission in role.permissions
}

default allow := false

allow := true if {
    some permission in permissions
    permission == input.resource.permission
}
