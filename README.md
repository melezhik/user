# SYNOPSIS

Manage linux users.

# INSTALL

    $ sparrow plg install user

# USAGE

## manually

    $ sparrow plg run user --param name=sparrow
    $ sparrow plg run user --param name=sparrow --param uid=2500 --param gid=1300
    $ sparrow plg run user --param name=sparrow --param managehome=no
    $ sparrow plg run user --param name=sparrow --param action=delete
    $ sparrow plg run user --param name=sparrow --param action=create --param password=12345

## via sparrowdo

    task-run 'create user sparrow', 'user', %(
      action   => 'create',
      name     => 'sparrow',
      password => '12345',
      home_dir => '/opt/sparrow',
      uid      => 453,
      gid      => 2300,
      groups   => '2301,wheel'
    );


# Parameters

## name

User name. Obligatory.

## password

Password for user.

## new_login

New user name. Used in `action=create` to change user name.
  
## uid

User ID.

## gid

User group ID.

## managehome

Create or delete home directory. One of two: `yes|no`. Default value is `yes`.

Use this option when `action=create`.

## home_dir

User home directory

## groups

List of user's groups. Should be comma separated list of items. For example:
   
   ` --param groups="developers,admins"`

## action

One of two: `create|delete`.  Default value is `create`.

If user already exists and `action=create` change user data ( login, gid, etc ).

# Maintainer

[Alexey Melezhik](mailto:melezhik@gmail.com)

