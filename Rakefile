require 'data_mapper'
require './server.rb'

task :auto_upgrade do 
  DataMapper.auto_upgrade!
  puts "Auto-upgrade complete (data was lost)"
end

task :auto_migrate do 
  DataMapper.auto_migrate! 
  puts "Auto-migrate complete (data was lost)"
end