require 'action_view'

require 'aloha/rails/cdn'
require 'aloha/rails/local'

module Aloha
  module Rails
    module Helpers

      include Cdn
      include Local

      def aloha_script_tag_url(url, options = {})
        raise TypeError, 'url must be a String' unless url.is_a? String

        options = {
          type: 'text/javascript',
          src: url,
        }.update(options)

        content_tag :script, nil, options
      end

      def aloha_stylesheet_tag_url(url, options = {})
        raise TypeError, 'url must be a String' unless url.is_a? String

        options = {
          rel: 'stylesheet',
          type: 'text/css',
          href: url
        }.update(options)

        content_tag :link, nil, options
      end

      def aloha_require(url, options = {})
        raise TypeError, 'url must be a String' unless url.is_a? String

        js = <<-JS
          function aloha_require() {
            require({
              context: 'aloha',
              baseUrl: '#{url}/lib'
              }, ['aloha'], function (Aloha) {
              });
            }
        JS
        javascript_tag js
      end

    end
  end
end
