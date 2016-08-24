# EBRC custom settings.
# This file managed by Ansible.

# override session_store in application.rb to set secure
config.session_store :cookie_store,
  :key => '_redmine_session',
  :secure => true,
  :path => config.relative_url_root || '/'
