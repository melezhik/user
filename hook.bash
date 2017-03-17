user=$(config name)
action=$(config action)

id $user &>/dev/null && is_user_exist=yes 

if [[ ! $action == delete ]] && [[ ! $action == create ]] ;then
  echo "Allowed action: <create|delete>"
  exit 5
fi

if [[ ! $is_user_exist == yes ]] && [[ $action == create ]]; then
  run_story create
fi

if [[ $is_user_exist == yes ]] && [[ $action == create ]]; then
  run_story change
fi

if [[ $is_user_exist == yes ]] && [[ $action == delete ]]; then
  run_story delete
fi
