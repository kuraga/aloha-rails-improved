require 'bundler'

Bundler.setup

require 'active_support'
require 'action_pack'
require 'action_view'

require File.expand_path(File.join(File.dirname(__FILE__), '../lib/aloha-rails-improved'))

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories in alphabetic order.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].sort.each { |f| require f }

RSpec.configure do |config|

end
