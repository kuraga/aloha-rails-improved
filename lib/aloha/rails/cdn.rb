module Aloha
  module Rails
    module Cdn

      mattr_accessor :cdn_base_url
      self.cdn_base_url = "http://cdn.aloha-editor.org/latest"

      mattr_accessor :cdn_script_url
      self.cdn_script_url = "#{self.cdn_base_url}/lib/aloha.js"

      mattr_accessor :cdn_stylesheet_url
      self.cdn_stylesheet_url = "#{self.cdn_base_url}/css/aloha.css"

      mattr_accessor :cdn_requirejs_url
      self.cdn_requirejs_url = "#{self.cdn_base_url}/lib/require.js"

      def aloha_requirejs_cdn
        options = {
          type: 'text/javascript',
          src: cdn_requirejs_url
        }
        content_tag :script, nil, options
      end

      def aloha_dependencies_cdn(options = {})
        aloha_requirejs_cdn
      end

      def aloha_cdn(options = {})
        aloha_script_tag_url(cdn_script_url, (options[:script] || {})) + aloha_stylesheet_tag_url(cdn_stylesheet_url, (options[:stylesheet] || {}))
      end

      def aloha_require_cdn(options = {})
        aloha_require(cdn_base_url, options)
      end

    end
  end
end
