# frozen_string_literal: true
require 'bundler/setup'
require 'rake/testtask'
require 'grape/activerecord/rake'

# Grape::ActiveRecord.db_dir = 'db'
# Grape::ActiveRecord.migrations_paths = ['db/migrate']
# Grape::ActiveRecord.fixtures_path = 'test/fixtures'
# Grape::ActiveRecord.seed_file = 'seeds.rb'

namespace :db do
  task :environment do
    require_relative 'config/application'
  end
end

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/**/*_test.rb']
end
