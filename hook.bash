user=$(config name)
action=$(config action)

id $user &>/dev/null && is_user_exist=yes

if [[ ! $is_user_exist == yes ]]; then
  echo "creating new user - $user"
  run_story create
fi

if [[ $is_user_exist == yes ]]; then
  echo "modifyng existing user"
  run_story change
fi

if [[ $is_user_exist == yes ]] && [[ $action == delete ]]; then
  echo "delete user"
  run_story delete
fi

