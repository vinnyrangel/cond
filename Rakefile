#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Pr01::Application.load_tasks

namespace :db do
	desc "drop create migrate seed"
  task :reset => ["db:drop", "db:create", "db:migrate", "db:seed"]
end


namespace :heroku do

    desc "Faz deploy no heroku"
    task :deploy do
      system "git push heroku master && heroku run rake db:migrate"
    end

    desc "regera a base de dados no heroku"
    task :dbreset => [ "db:reset" ]
end

