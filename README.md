
## EasyRedmine Package

Place a copy of the EasyRedmine package (obtained from the vendor
customer portal) in `scratch`. Set the file name for
`installer_package_name` in `roles/easyredmine/vars/main.yml`

## Redmine sample data

To install an empty database, set `do_redmine_db_import` to `False` in
`roles/easyredmine/vars/main.yml`

To import a copy of an existing Redmine database, place a copy of the
MySQL dump file at `scratch/redmine_dump.sql.gz`. _(One of the daily
backups on our production Redmine server is suitable. See
`/var/lib/mysql.backups/daily/redmine/`.)_

Set `do_redmine_db_import` to `True` in `roles/easyredmine/vars/main.yml`
