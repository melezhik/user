
user=$(config name)

if test "${user}"; then
  userdel -r -f $user
  id $user 2>/dev/null || echo user removed
fi
