require 'spec_helper'

describe Aloha::Rails::Local do

  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::JavaScriptHelper
  include Aloha::Rails::Helpers

  context 'url settings' do

    context 'defaults' do
      it 'has Aloha Editor\'s CDN urls' do
        expect(Aloha::Rails::Local.local_base_url).to eq('http://local.aloha-editor.org/latest')
        expect(Aloha::Rails::Local.local_script_url).to eq('http://local.aloha-editor.org/latest/lib/aloha.js')
        expect(Aloha::Rails::Local.local_stylesheet_url).to eq('http://local.aloha-editor.org/latest/css/aloha.css')
      end
    end

    context 'configuring' do
      it 'should be configurable' do
        Aloha::Rails::Local.local_base_url = 'http://other-local.aloha-editor.org'
        expect(Aloha::Rails::Local.local_base_url).to eq('http://other-local.aloha-editor.org')

        Aloha::Rails::Local.local_script_url = 'http://other-local.aloha-editor.org/latest/lib/aloha.js'
        expect(Aloha::Rails::Local.local_script_url).to eq('http://other-local.aloha-editor.org/latest/lib/aloha.js')

        Aloha::Rails::Local.local_stylesheet_url = 'http://other-local.aloha-editor.org/latest/css/aloha.css'
        expect(Aloha::Rails::Local.local_stylesheet_url).to eq('http://other-local.aloha-editor.org/latest/css/aloha.css')
      end
    end

  end

  context '#aloha_local' do

    context 'with no options' do
      it 'returns #aloha_script_tag_url, #aloha_stylesheet_tag_url' do
        self.should_receive(:aloha_script_tag_url).with(self.local_script_url, {}) { '<script>' } 
        self.should_receive(:aloha_stylesheet_tag_url).with(self.local_stylesheet_url, {}) { '<stylesheet>' } 
        expect(aloha_local).to eq('<script><stylesheet>')
      end
    end

    context 'with some options' do
      it 'returns #aloha_script_tag_url, #aloha_stylesheet_tag_url with these options' do
        self.should_receive(:aloha_script_tag_url).with(self.local_script_url, 'some-script-option' => 'some-script-option-value') { '<script>' } 
        self.should_receive(:aloha_stylesheet_tag_url).with(self.local_stylesheet_url, 'some-stylesheet-option' => 'some-stylesheet-option-value') { '<stylesheet>' } 
        expect(aloha_local(
          script: { 'some-script-option' => 'some-script-option-value' },
          stylesheet: {'some-stylesheet-option' => 'some-stylesheet-option-value' },
        )).to eq('<script><stylesheet>')
      end
    end
  end

  context '#aloha_require_local' do

    context 'with no options' do
      it 'returns #aloha_require' do
        self.should_receive(:aloha_require).with(self.local_base_url, {}) { '<aloha_require>' } 
        expect(aloha_require_local).to eq('<aloha_require>')
      end
    end

    context 'with some options' do
      it 'returns #aloha_require with these options' do
        self.should_receive(:aloha_require).with(self.local_base_url, 'some-option' => 'some-script-value') { '<aloha_require>' } 
        expect(aloha_require_local('some-option' => 'some-script-value')).to eq('<aloha_require>')
      end
    end
  end

end
