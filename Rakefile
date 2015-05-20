require "bundler/gem_tasks"
require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/**/*_spec.rb'
end

desc 'Compile the java classes'
task :java_compiler do
  puts "Compiling java classes"
  system('javac spec/java_classes/**/*.java')
end

desc 'Run the test on classes'
task :compile_and_spec => [:java_compiler, :spec] do
end
