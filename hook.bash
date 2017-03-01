set -x 
user=$(config name)
action=$(config action)

if [[ `grep  $user /etc/passwd` ]]; then
  if [[ $action == delete ]]; then
    run_story delete
  else
    run_story change 
  fi
else
  run_story $action
fi
