require 'spec_helper'

describe Aloha::Rails::Helpers do

  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::JavaScriptHelper
  include Aloha::Rails::Helpers

  context '#aloha_script_tag_url' do

    it 'returns a javascript tag' do
      expect(aloha_script_tag_url('some-url')).to match(%r{<script.+type="text/javascript"></script>})
    end

    context 'with valid (String) url and no options' do
      it 'returns #aloha_script_tag with this url' do
        expect(aloha_script_tag_url('some-url')).to match(%r{src="some-url"})
      end
    end

    context 'with valid (String) url and some options' do
      it 'returns #aloha_script_tag with this url and these options' do
        res = aloha_script_tag_url('some-url', 'other-option' => 'other-option-value')
        expect(res).to match(%r{src="some-url"})
        expect(res).to match(%r{other-option="other-option-value"})
      end
    end

    context 'with non-valid (non-String) url' do
      it 'raises TypeError exception' do
        expect { aloha_script_tag_url(Math::PI) }.to raise_error(TypeError, 'url must be a String')
      end
    end

    context 'with custom options' do
      it 'uses these options' do
        expect(aloha_script_tag_url('some-url', 'other-option' => 'other-option-value')).to match(%r{other-option="other-option-value"})
      end
    end

  end

  context '#aloha_stylesheet_tag_url' do

    it 'returns a stylesheet tag' do
      expect(aloha_stylesheet_tag_url('some-url')).to match(%r{<link.+rel="stylesheet" type="text/css">})
    end

    context 'with valid (String) url and no options' do
      it 'returns #aloha_stylesheet_tag with this url' do
        expect(aloha_stylesheet_tag_url('some-url')).to match(%r{href="some-url"})
      end
    end

    context 'with valid (String) url and some options' do
      it 'returns #aloha_stylesheet_tag with this url and these options' do
        res = aloha_stylesheet_tag_url('some-url', 'other-option' => 'other-option-value')
        expect(res).to match(%r{href="some-url"})
        expect(res).to match(%r{other-option="other-option-value"})
      end
    end

    context 'with non-valid (non-String) url' do
      it 'raises TypeError exception' do
        expect { aloha_stylesheet_tag_url(Math::PI) }.to raise_error(TypeError, 'url must be a String')
      end
    end

  end

  context '#aloha_require' do

    context 'with valid (String) url and no options' do
      it 'returns a javascript tag' do
        expect(aloha_require('some-url')).to match(%r{<script type="text/javascript">})
      end
    end

    context 'with non-valid (non-String) url' do
      it 'raises TypeError exception' do
        expect { aloha_require(Math::PI) }.to raise_error(TypeError, 'url must be a String')
      end
    end

  end
end
