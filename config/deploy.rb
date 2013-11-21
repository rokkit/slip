set :application, 'slip'
set :repo_url, 'https://github.com/rokkit/slip.git'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, '/home/www/slip'
set :scm, :git
# set :deploy_via, :copy

# set :format, :pretty
# set :log_level, :debug
set :pty, true

## set :shared_children, fetch(:shared_children) + %w{public/uploads}
# set :linked_files, %w{config/database.yml}
# set :linked_files, %w{config/application.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5

namespace :deploy do
  desc 'Start solr and reindex'                                                        
  task :reindex do
    on roles(:app), in: :sequence, wait: 5 do
      # run "cd #{release_path} && #{rake} RAILS_ENV=#{rails_env} sunspot:solr:stop" 
      # run "cd #{release_path} && #{rake} RAILS_ENV=#{rails_env} sunspot:solr:start" 
      execute "cd #{current_path} && bundle exec rake sunspot:reindex RAILS_ENV=production" 
    end
  end
  desc "reload the database with seed data"
    task :seed do
      on roles(:app), in: :sequence, wait: 1 do
        execute "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=production"
      end
    end
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
      puts shared_path
          execute "rm -rf #{release_path}/public/uploads"
          # execute "mkdir #{shared_path}/uploads"
          execute "ln -nfs #{shared_path}/uploads #{release_path}/public/uploads"
          
          execute "chmod 777 -R #{current_path}/log"
          execute "chmod 777 -R #{current_path}/tmp"
          execute "chmod 777 -R #{current_path}/public"
          execute "chmod 777 -R #{shared_path}/uploads"
      # execute "ln -s #{shared_path}/files/ #{release_path}/public"
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'
  # after :finishing, 'solr:reindex'
end

# after :deploy do
#   run "#{try_sudo} chmod 777 -R #{current_path}/log"
#   run "#{try_sudo} chmod 777 -R #{current_path}/tmp"
#   run "#{try_sudo} chmod 777 -R #{current_path}/public"
# end

namespace :solr do      

end 
