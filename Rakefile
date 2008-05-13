$:.unshift(File.join(File.dirname(__FILE__), 'lib'))
%w(rubygems rake rake/clean rake/rdoctask fileutils pp halcyon logger rack/mock).each{|dep|require dep}

include FileUtils

# Halcyon.root => the root application directory
# Halcyon.app  => the application name

desc "Start the application on port 4647"
task :start do
  sh "halcyon start -p 4647"
end

desc "Generate RDoc documentation"
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.options << '--line-numbers' << '--inline-source' <<
    '--main' << 'README' <<
    '--title' << "#{Halcyon.app} Documentation" <<
    '--charset' << 'utf-8'
  rdoc.rdoc_dir = "doc"
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('app/**/*.rb')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

# = Custom Rake Tasks
# 
# Add your custom rake tasks here.

desc "Load up the application environment"
task :env do
  $log = ''
  $logger = Logger.new(StringIO.new($log))
  Halcyon.config = {:logger => $logger}
  Halcyon::Runner.new
end

namespace(:db) do
  desc "Migrate the database to the latest version"
  task :migrate => :env do
    current = Sequel::Migrator.get_current_migration_version(WeeDB::DB)
    latest = Sequel::Migrator.apply(WeeDB::DB, Halcyon.paths[:lib]/'migrations')
    puts "Database successfully migrated to latest version (#{latest})." if current < latest
    puts "Migrations finished successfully."
  end
end

# ...

# = Default Task
task :default => Rake::Task['start']
