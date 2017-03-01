# SYNOPSIS

Manages a linux user.

# INSTALL

    $ sparrow plg install user

# USAGE

## manually

    $ sparrow plg run user --param name=sparrow
    $ sparrow plg run user --param name=sparrow --param uid=2500 --param gid=1300
    $ sparrow plg run user --param name=sparrow --param managehome=no
    $ sparrow plg run user --param name=sparrow --param action=delete

## via sparrowdo

    task-run 'create user sparrow', 'user', %(
      action   => 'create',
      name     => 'sparrow',
      home_dir => '/opt/sparrow',
      uid      => 453,
      gid      => 2300,
      groups   => '2301,wheel'
    );


# Parameters

## name

User name. Obligatory.
  
## uid

User uid.

## gid

User gid.

## managehome

Create or delete home directory.

One of two: yes|no. Default value is `yes`.

## home_dir

Home directory for your user. 

## groups

List of groups for user. Separated by comma.

## action

One of three: create|delete|change. Default value is `create` if user doesn't present. If a user already exists in system it will be changed according your params.


# AUTHOR

[Alexey Melezhik](mailto:melezhik@gmail.com)

