package example

import rego.v1 

roles contains role.id if {
    some org in input.user.organizations
    org.id == input.resource.organization_id
    some role in org.roles
}

matched_roles = roles if {
    some role in data.roles.role
    role.id in roles
}

permissions contains permission if {
    some role in data.roles.role
    role.id in roles
    some permission in role.permissions
}

default allow := false

allow111 := true if {
    some permission in permissions
    permission == input.resource.permission
}
