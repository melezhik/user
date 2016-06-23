user=$(config user)
userdel -r -f $user
id $user 2>/dev/null || echo user removed
