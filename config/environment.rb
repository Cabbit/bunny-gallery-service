require 'ostruct'
require 'pathname'
require 'yaml'
require 'globalize'
I18n.load_path += Dir['config/locale/*.yml']
I18n.locale = :en
I18n::Backend::Simple.send(:include, I18n::Backend::Fallbacks)

# Load environment settings
Config = OpenStruct.new
Config.env = ENV['RACK_ENV'] ? ENV['RACK_ENV'].to_sym : :development
Config.root = Pathname.new(File.expand_path('../..', __FILE__))

# Load dependencies
require 'bundler'
Bundler.require(:default, Config.env)
