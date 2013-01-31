require 'spec_helper'

describe Aloha::Rails::Cdn do

  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::JavaScriptHelper
  include Aloha::Rails::Helpers

  context 'url settings' do

    context 'defaults' do
      it 'has Aloha Editor\'s CDN urls' do
        expect(Aloha::Rails::Cdn.cdn_base_url).to eq('http://cdn.aloha-editor.org/latest')
        expect(Aloha::Rails::Cdn.cdn_script_url).to eq('http://cdn.aloha-editor.org/latest/lib/aloha.js')
        expect(Aloha::Rails::Cdn.cdn_stylesheet_url).to eq('http://cdn.aloha-editor.org/latest/css/aloha.css')
        expect(Aloha::Rails::Cdn.cdn_requirejs_url).to eq('http://cdn.aloha-editor.org/latest/lib/require.js')
      end
    end

    context 'configuring' do
      it 'should be configurable' do
        Aloha::Rails::Cdn.cdn_base_url = 'http://other-cdn.aloha-editor.org'
        expect(Aloha::Rails::Cdn.cdn_base_url).to eq('http://other-cdn.aloha-editor.org')

        Aloha::Rails::Cdn.cdn_script_url = 'http://other-cdn.aloha-editor.org/latest/lib/aloha.js'
        expect(Aloha::Rails::Cdn.cdn_script_url).to eq('http://other-cdn.aloha-editor.org/latest/lib/aloha.js')

        Aloha::Rails::Cdn.cdn_stylesheet_url = 'http://other-cdn.aloha-editor.org/latest/css/aloha.css'
        expect(Aloha::Rails::Cdn.cdn_stylesheet_url).to eq('http://other-cdn.aloha-editor.org/latest/css/aloha.css')

        Aloha::Rails::Cdn.cdn_requirejs_url = 'http://other-cdn.aloha-editor.org/latest/lib/require.js'
        expect(Aloha::Rails::Cdn.cdn_requirejs_url).to eq('http://other-cdn.aloha-editor.org/latest/lib/require.js')
      end
    end

  end

  context '#aloha_requirejs_cdn' do

    it 'returns a javascript tag' do
      expect(aloha_requirejs_cdn).to match(%r{<script.+type="text/javascript"></script>})
    end

    it 'script src is equal to .cdn_requirejs_url' do
      Aloha::Rails::Cdn.cdn_requirejs_url = 'cdn-requirejs-url' # TODO stub
      expect(aloha_requirejs_cdn).to match(%r{src="cdn-requirejs-url"})
    end

  end

  context '#aloha_dependencies_cdn' do

    it 'returns #aloha_jquery_cdn, #aloha_requirejs_cdn' do
      self.should_receive(:aloha_requirejs_cdn) { '<requirejs>' } 
      expect(aloha_dependencies_cdn).to eq('<requirejs>')
    end

  end

  context '#aloha_cdn' do

    context 'with no options' do
      it 'returns #aloha_script_tag_url, #aloha_stylesheet_tag_url' do
        self.should_receive(:aloha_script_tag_url).with(self.cdn_script_url, {}) { '<script>' } 
        self.should_receive(:aloha_stylesheet_tag_url).with(self.cdn_stylesheet_url, {}) { '<stylesheet>' } 
        expect(aloha_cdn).to eq('<script><stylesheet>')
      end
    end

    context 'with some options' do
      it 'returns #aloha_script_tag_url, #aloha_stylesheet_tag_url with these options' do
        self.should_receive(:aloha_script_tag_url).with(self.cdn_script_url, 'some-script-option' => 'some-script-option-value') { '<script>' } 
        self.should_receive(:aloha_stylesheet_tag_url).with(self.cdn_stylesheet_url, 'some-stylesheet-option' => 'some-stylesheet-option-value') { '<stylesheet>' } 
        expect(aloha_cdn(
          script: { 'some-script-option' => 'some-script-option-value' },
          stylesheet: {'some-stylesheet-option' => 'some-stylesheet-option-value' },
        )).to eq('<script><stylesheet>')
      end
    end
  end

  context '#aloha_require_cdn' do

    context 'with no options' do
      it 'returns #aloha_require' do
        self.should_receive(:aloha_require).with(self.cdn_base_url, {}) { '<aloha_require>' } 
        expect(aloha_require_cdn).to eq('<aloha_require>')
      end
    end

    context 'with some options' do
      it 'returns #aloha_require with these options' do
        self.should_receive(:aloha_require).with(self.cdn_base_url, 'some-option' => 'some-script-value') { '<aloha_require>' } 
        expect(aloha_require_cdn('some-option' => 'some-script-value')).to eq('<aloha_require>')
      end
    end

  end

end
