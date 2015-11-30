# EasyRedmine

This is a Vagrant project to host a development copy of EuPathDB's
EasyRedmine

It is primarily focused on being a playground for migrating from our
vanilla Redmine 2.3.

Once provisioned, Redmine should be available at http://redmine.vm.apidb.org/

## Requirements

- `rvm1-ansible` Ansible module

        ansible-galaxy install rvm_io.rvm1-ruby

- `scratch/redmine_dump.sql.gz` - a mysql dump of our production
database.  _(One of the daily backups on our production Redmine server
is suitable. See `/var/lib/mysql.backups/daily/redmine/`.)_

- `scratch/easyredmine_package_u2072_d201511101601.zip` - the
installation package provided by EasyRedmine (downloaded from their
customer portal).

- Vagrant `landrush` plugin

- When working with a database imported from our production Redmine, you
will need a VPN tunnel to UGA's campus so LDAP authentication queries
can complete. A stock EasyRedmine installation does local
authentication, so no VPN is needed in such case.

## Provisioning

Start the virtual machine with `vagrant up`.

Vagrant provisions the VM using Ansible. See
`playbook.yml` for configuration options. Especially,

- `do_redmine_db_import`: if `True`, will import sample data from a
mysql dump file
- `do_redmine_installer`: if `True`, will run the redmine installer if
`redmine_root_dir` does not exist or if there is a detected change in
the database (e.g. you drop it and let Ansible recreate it).

## Configuration

Configuration variables are in `playbook.yml`

## EasyRedmine Package

Place a copy of the EasyRedmine package (obtained from the vendor
customer portal) in `scratch`. Set the file name for
`installer_package_name` in `playbook.yml`

## Redmine sample data

To install an empty database, set `do_redmine_db_import` to `False` in
`playbook.yml`

To import a copy of an existing Redmine database, place a copy of the
MySQL dump file at `scratch/redmine_dump.sql.gz`. _(One of the daily
backups on our production Redmine server is suitable. See
`/var/lib/mysql.backups/daily/redmine/`.)_

Set `do_redmine_db_import` to `True` in `playbook.yml`
