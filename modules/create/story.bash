user=$(config name)
uid=$(config uid)
gid=$(config gid)
is_managehome=$(config managehome)
homedir=$(config home_dir)
groups=$(config groups)

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

if [[ $is_managehome == yes ]] && [[ -n $homedir ]]; then
  homedir=" -d $homedir"
fi

if [[ -n $groups ]] ; then
  groups=" -G $groups"
fi

useradd $home_key $homedir $name_key $uid_key $gid_key $groups

id $user && echo user created

