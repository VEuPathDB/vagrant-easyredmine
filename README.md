# EasyRedmine

This is a Vagrant project to host a development copy of EuPathDB's
EasyRedmine

It is primarily focused on being a playground for migrating from our
vanilla Redmine 2.3, however it can also be used to install EasyRedmine
with an empty database.

Once provisioned, Redmine should be available at http://redmine.vm.apidb.org/

## Requirements

- Vagrant installed on your local host

- Ansible [installed on your local host](http://docs.ansible.com/ansible/intro_installation.html)

- Vagrant `landrush` plugin

        vagrant install landrush

- `scratch/redmine_dump.sql.gz` - a mysql dump of our production
database.  _(One of the daily backups on is suitable. See
`/var/lib/mysql.backups/daily/easyredmine/` on the server that hosts the
Redmine database.)_ This is optional. To have the redmine installer
create an empty database, set `do_redmine_db_import` to `False` in
`config.yml`

- `scratch/easyredmine_package_u2072_d201511101601.zip` - the
installation package provided by EasyRedmine (downloaded from their
[customer portal](https://www.easyredmine.com/customer-portal)).
Set the file name for `installer_package_name` in `config.yml`

- When working with a database imported from our production Redmine, you
will need a VPN tunnel to UGA's campus so LDAP authentication queries
can complete. A stock EasyRedmine installation, not using our database,
does local authentication, so no VPN is needed in such case.

## Provisioning

Vagrant provisions the VM using Ansible. See
`config.yml` for configuration options. Especially,

- `do_redmine_db_import`: if `True`, will import sample data from a
mysql dump file. If `False`, an empty database will be created by the
redmine installer (if run).

- `do_redmine_installer`: if `True`, will run the redmine installer if
`redmine_root_dir` does not exist or if there is a detected change in
the database (e.g. you drop it and let Ansible recreate it).

**Note:** The `run redmine installer` Ansible task can take a long time
and there is no stdout to the console to indicate progress. The
installer includes installing several Ruby gems and database migration
steps so the installer run time is affected by network speed and
database state. On the other hand the installer may prompt for input
that the expect script is not expecting. This causes the installer to
hang indefinitely waiting for input that the non-interactive script
cannot provide. The `~/install.log` captures the stdout of the process
and should be consulted to check for running state.

Start the virtual machine with `vagrant up`. This boots the VM and
starts provisioning.

## Production Installation

See https://wiki.apidb.org/index.php/EasyRedmineVM for instructions for
using the Ansible plays from this project to prepare a KVM image for
production use.


## Development Troubleshooting

To manually delete the database on the virtual machine and manually
import the dump file.

    mysql -u root --password='' -e "DROP DATABASE easyredmine"
    mysql -u root --password='' -e "CREATE DATABASE easyredmine CHARACTER SET utf8"
    mysql -u root --password='' -e "CREATE USER 'easyredmine' IDENTIFIED BY '@redmin3r'"
    mysql -u root --password='' -e "CREATE USER 'easyredmine'@'localhost' IDENTIFIED BY '@redmin3r'"
    mysql -u root --password='' -e "GRANT ALL PRIVILEGES ON easyredmine.* TO 'easyredmine'"
    zcat /vagrant/scratch/redmine_dump.sql.gz | mysql -u easyredmine -p'@redmin3r' easyredmine
