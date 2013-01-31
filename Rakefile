#!/usr/bin/env rake
require "bundler/gem_tasks"

load 'lib/tasks/aloha/update.rake'

require 'rspec/core/rake_task'
desc "Run all examples"
RSpec::Core::RakeTask.new(:spec)

task :default => :spec
task :test => :spec
