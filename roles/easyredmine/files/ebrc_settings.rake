desc <<-END_DESC
Delete orphaned custom_values table rows from the database that once belonged to Projects that are now deleted. This
cleanup is needed before migrating to Easy Redmine.

Example:
  rake redmine:ebrc_settings RAILS_ENV=production 
END_DESC
namespace :redmine do
  task :ebrc_settings => :environment do

    Setting.ui_theme = '' # Default

    EasySetting.where(:name => 'hide_login_quotes').each do |setting|
      setting.value = true
      setting.save
    end

    EasySetting.where(:name => 'show_easy_resource_booking').each do |setting|
      setting.value = false
      setting.save
    end

    EasySetting.where(:name => 'show_personal_statement').each do |setting|
      setting.value = false
      setting.save
    end

    EasySetting.where(:name => :attachment_description).each do |setting|
      setting.value = true
      setting.save
    end
    EasySetting.where(:name => :attachment_description_required).each do |setting|
      setting.value = false
      setting.save
    end

  end
end