user=$(config name)
newlogin=$(config new_login)
uid=$(config uid)
gid=$(config gid)
is_managehome=$(config managehome)
homedir=$(config home_dir)
groups=$(config groups)

check_old_user() {
old_user_id=`id $user`

if [[ $is_home_need_check == 1 ]];then
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
  if [[ -n $homedir ]]; then
    is_home_need_check=1
    new_user_home=$homedir
    homedir_key="-m -d $homedir"
  fi
elif [[ $is_managehome == no ]]; then
  echo "user home dir will not move"
else
  echo "Value of managehome is unknown (yes/no)"
  exit 2
fi



if [[ -n $groups ]] ; then
  groups=" -G $groups"
fi

if [[ -n $newlogin ]] ; then
  new_login=" -l $newlogin"
fi

check_old_user

usermod $name $new_login $uid $gid $homedir_key $groups 2>/dev/null 

# Check new user by given login
if [[ -n $newlogin ]]; then
  new_user_id=$(id $newlogin)
else 
  new_user_id=$(id $user)
fi

if [[ ! "$old_user_id" == "$new_user_id" ]] || [[ ! $old_user_home == $new_user_home ]] ; then
  echo "user $user changed"
else
  echo "user $user - nothing changed"
fi
