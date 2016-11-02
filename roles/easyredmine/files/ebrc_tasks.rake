namespace :eupathdb do

  desc 'Fetch changesets from the repositories. Same as redmine:fetch_changesets but with added timeout'
  task :fetch_changesets => :environment do
    Timeout.timeout(120) do
      Repository.fetch_changesets
    end
  end

end
