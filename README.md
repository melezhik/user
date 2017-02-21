# SYNOPSIS

Manages a linux user.

# INSTALL

    $ sparrow plg install user

# USAGE

    $ sparrow plg run user --param name=sparrow
    $ sparrow plg run user --param name=sparrow --param uid=2500 --param gid=1300
    $ sparrow plg run user --param name=sparrow --param managehome=no
    $ sparrow plg run user --param name=sparrow --param action=delete

# Parameters

## name

User name.
  
## uid

User uid.

## gid

User gid.

## managehome

Create or delete home directory.

One of two: yes|no. Default value is `yes`.

## action

One of two: create|delete. Default value is `create`.


# AUTHOR

[Alexey Melezhik](mailto:melezhik@gmail.com)



