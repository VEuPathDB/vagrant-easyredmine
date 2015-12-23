# EasyRedmine

This is a Vagrant project to host a development copy of EuPathDB's
EasyRedmine

It is primarily focused on being a playground for migrating from our
vanilla Redmine 2.3, however it can also be used to install EasyRedmine
with an empty database.

Once provisioned, Redmine should be available at http://redmine.vm.apidb.org/

## Requirements

- `rvm1-ansible` Ansible module

        ansible-galaxy install rvm_io.rvm1-ruby

- Vagrant `landrush` plugin

        ansible-galaxy install landrush

- `scratch/redmine_dump.sql.gz` - a mysql dump of our production
database.  _(One of the daily backups on our production Redmine server
is suitable. See `/var/lib/mysql.backups/daily/redmine/`.)_ This is
optional. To have the redmine installer create an empty database, set
`do_redmine_db_import` to `False` in `config.yml`

- `scratch/easyredmine_package_u2072_d201511101601.zip` - the
installation package provided by EasyRedmine (downloaded from their
customer portal). Set the file name for `installer_package_name` in
`config.yml`

- When working with a database imported from our production Redmine, you
will need a VPN tunnel to UGA's campus so LDAP authentication queries
can complete. A stock EasyRedmine installation, not using our database,
does local authentication, so no VPN is needed in such case.

## Provisioning

Start the virtual machine with `vagrant up`.

Vagrant provisions the VM using Ansible. See
`config.yml` for configuration options. Especially,

- `do_redmine_db_import`: if `True`, will import sample data from a
mysql dump file. If `False`, an empty database will be created by the
redmine installer (if run).

- `do_redmine_installer`: if `True`, will run the redmine installer if
`redmine_root_dir` does not exist or if there is a detected change in
the database (e.g. you drop it and let Ansible recreate it).

## Production Installation

See https://wiki.apidb.org/index.php/EasyRedmineVM for instructions for
using the Ansible plays from this project to prepare a KVM image for
production use.
