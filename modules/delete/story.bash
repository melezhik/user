set -e

user=$(config name)
managehome=$(config managehome)

if [[ -n $user ]]; then
  name_key=" $user"
fi
if [[ $managehome == yes ]]; then
  home_key=" -r"
fi

userdel $home_key $name_key

id $user 2>/dev/null || echo "user $user removed"

