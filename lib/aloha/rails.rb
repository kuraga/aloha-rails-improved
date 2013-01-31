require 'aloha/rails/version'
require 'aloha/rails/railtie' if defined?(::Rails)

module Aloha
  module Rails

    autoload :Helpers, 'aloha/rails/helpers'

  end
end

require 'aloha/rails/helpers'
require 'aloha/rails/cdn'
require 'aloha/rails/local'
