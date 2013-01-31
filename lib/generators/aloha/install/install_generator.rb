class Aloha::InstallGenerator < Rails::Generators::Base

  source_root File.expand_path('../templates', __FILE__)
  class_option :coffee, type: :boolean, default: false, desc: 'Install coffeescript file instead of javascript'

  def copy_config
    if options[:coffee]
      template 'aloha-config.js.coffee', File.join('app', 'assets', 'javascripts', 'aloha-config.js.coffee')
    else
      template 'aloha-config.js', File.join('app', 'assets', 'javascripts', 'aloha-config.js')
    end
  end

end
