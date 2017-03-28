user=$(config name)
is_managehome=$(config managehome)

if [[ -n $user ]]; then
  name_key=" $user"
fi
if [[ $is_managehome == yes ]]; then
  home_key=" -r"
fi

userdel $home_key $name_key

id $user 2>/dev/null || echo "user $user removed"

