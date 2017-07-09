set_spl %( dev-user => 'https://github.com/Spigell/user' );

my $user = 'sparrow';

task-run "create user $user", 'dev-user', %(
  action   => 'create',
  name     => "$user",
  uid      => '4000',
  home_dir => "/home/$user",
  groups   => 'wheel',
);

task-run "change user $user", 'dev-user', %(
  name     => "$user",
  uid      => '4005',
  home_dir => "/tmp/$user",
  groups   => 'wheel',
);

task-run "remove user $user", 'dev-user', %(
  action   => 'delete',
  name     => "$user",
);