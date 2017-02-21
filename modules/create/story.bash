user=$(config name)
uid=$(config uid)
gid=$(config gid)
is_managehome=$(config managehome)

if [[ -n $uid ]]; then
  uid_key=" -u $uid"
fi
if [[ -n $user ]]; then
  name_key=" $user"
else
  echo "Need user name"
  exit 1
fi
if [[ -n $gid ]]; then
  gid_key=" -g $gid"
fi
if [[ $is_managehome == yes ]]; then
  home_key=" -m"
elif [[ $is_managehome == no ]]; then
  home_key=" -M"
else
  echo "Value of managehome is unknown (yes/no)"
  exit 2
fi

useradd $home_key $name_key $uid_key $gid_key

id $user && echo user created

