user=$(config name)
newlogin=$(config new_login)
uid=$(config uid)
gid=$(config gid)
is_managehome=$(config managehome)
homedir=$(config home_dir)
groups=$(config groups)

check_old_user() {
old_user_id=`id $user`

if [[ $is_home_changed == 1 ]];then
  old_user_home=$(grep $user /etc/passwd | cut -f 6 -d ":")
fi
}

if [[ -n $uid ]]; then
  uid=" -u $uid"
fi

if [[ -n $user ]]; then
  name=" $user"
else
  echo "Need user name"
  exit 1
fi

if [[ -n $gid ]]; then
  gid=" -g $gid"
fi

if [[ $is_managehome == yes ]]; then
  home_key=" -m"
elif [[ $is_managehome == no ]]; then
  home_key=" -M"
else
  echo "Value of managehome is unknown (yes/no)"
  exit 2
fi

if [[ -n $homedir ]]; then
  is_home_changed=1
  new_user_home=$homedir
  homedir=" -d $homedir"
fi

if [[ -n $groups ]] ; then
  groups=" -G $groups"
fi

if [[ -n $newlogin ]] ; then
  new_login=" -l $newlogin"
fi

check_old_user

usermod $name $new_login $uid $gid $home_key $homedir $groups

# Check new user by given login
if [[ -n $newlogin ]]; then
  new_user_id=$(id $newlogin)
else 
  new_user_id=$(id $user)
fi

if [[ ! "$old_user_id" == "$new_user_id" ]] || [[ ! $old_user_home == $new_user_home ]] ; then
  echo "user changed"
else
  echo "nothing changed"
fi
