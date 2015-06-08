require "bundler/gem_tasks"
require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/**/*_spec.rb'
end

desc 'Compile the java classes'
task :java_compiler do
  puts "Compiling java classes"
  Dir.glob(File.join('spec', 'java_classes','**','*.java')).each do |file|
    file.gsub!('spec/java_classes/', '')
    system("cd spec/java_classes && javac #{file}")
  end
end

desc 'Run the test on classes'
task :compile_and_spec => [:java_compiler, :spec] do
end
