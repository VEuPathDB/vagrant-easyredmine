rvm.ruby.patch
=========

Patches to [rvm1-ansible](https://github.com/rvm/rvm1-ansible) role.

- install `/etc/profile.d/rvm.sh` - https://github.com/rvm/rvm1-ansible/issues/135

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```
    - hosts: servers
      roles:
         - { role: rvm.ruby.patch }
```

License
-------

BSD

