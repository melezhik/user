user=$(config name)

if test "${user}"; then
  useradd -m $user
  id $user && echo user created
fi

