#set :application, "controlesupermercado"
#set :repository,  "set your repository location here"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

# Capistrano deployment script


role :app, ""

set :use_sudo, false
set :application, 'controlesupermercado'     # you'll need to specify an app name
set :repository, "."
set :scm, :none
set :deploy_to, "/var/www/dev.sidriao.com/"   # the destination dir
set :deploy_via, :copy
set :copy_dir, "/home/sidriao/tmp"
set :copy_remote_dir, "/tmp"

set :keep_releases, 3
after "deploy:restart", "deploy:cleanup" 

# override deploy:restart since this isn't a Rails app
namespace :deploy do
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

# # Capistrano deployment script Detran

# set :application, "deposito"

# set :repository, "svn+ssh://172.25.136.61/usr/svn/veiculo/trunk/PROJETOS-RUBY/deposito_atendimento"
# #set :scm, "git"
# set :deploy_via, :remote_cache
# set :user, "sidriaoneto"
# set :keep_releases, 2

# # set :branch, "master"

# # set :scm_passphrase, "p@ssw0rd"  # The deploy user's password

# set :copy_exclude, [ ".git", ".svn", "doc/**", "spec/**", ".autotest", ".rspec", ".rdebugrc" ]
# set :deploy_via, :copy
# set :deploy_to, "/var/www/rails/deposito_deploy"
# set :use_sudo, false
# set :keep_releases, 2

# role :prod_int, "172.25.136.97", :externo => false
# #role :homologacao, "172.25.137.34", :externo => false

# namespace :deploy do
#   task :restart, :except=>{:no_release => true} do
#     run "touch #{current_path}/tmp/restart.txt"
#   end
# end
# after "deploy:update", "deploy:cleanup"

# after "deploy:update", "deploy:cleanup"

# after "deploy" do
#   #run "cd #{release_path} && rvm rvmrc trust && bundle install --local --without=test development"
# end

# #after "deploy" do
# #  run "cd #{current_path}/script; chmod +x runner"
# #end

