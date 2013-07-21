# Aloha::Rails::Improved

Power your Rails app with the [Aloha Editor](http://aloha-editor.org/)!

[![TravisCI Build Status](https://secure.travis-ci.org/kuraga/aloha-rails-improved.png?branch=master)](http://travis-ci.org/kuraga/aloha-rails-improved)
[![Gem Version](https://badge.fury.io/rb/aloha-rails-improved.png)](http://badge.fury.io/rb/aloha-rails-improved)
[![Dependency Status](https://gemnasium.com/kuraga/aloha-rails-improved.png)](https://gemnasium.com/kuraga/aloha-rails-improved) 
[![Code Climate](https://codeclimate.com/github/kuraga/aloha-rails-improved.png)](https://codeclimate.com/github/kuraga/aloha-rails-improved)

## Installation

Required Ruby version:

* 1.9.3,
* 2.0.0,
* rbx-19mode,
* jruby-19mode.

Required gems:

* [ActionPack](http://rubygems.org/gems/actionpack) 3.0, 3.1, 3.2 or 4.0.
* [ActiveSupport](http://rubygems.org/gems/activesupport) 3.0, 3.1, 3.2 or 4.0,

(you can use [Rails](http://rubygems.org/gems/rails) 3.0, 3.1, 3.2 or 4.0 to require this).

Add this line to your application's `Gemfile`:

    gem 'aloha-rails-improved'

Or, if you want to be on the edge:

    gem 'aloha-rails', git: 'https://github.com/kuraga/aloha-rails-improved.git', branch: 'develop'

## Basic Usage

Just make quick steps to start using Aloha Editor in your Rails app!

1. Generate your Aloha Editor config:
    ```sh
    rails generate aloha:install
    ```

2. Load Aloha Editor from your layout:
    ```erb
    <%= javascript_include_tag 'aloha-config' %>
    <%= aloha_dependencies_cdn %>
    <%= aloha_require_cdn %>
    ```

3. Then write javascript to start edit a textarea:
    ```javascript
    $('#some-textarea').aloha();
    ```

Enjoy!

## Custom Usage

You should make these things to start using Aloha Editor in your app:

1. Generate your Aloha Editor config: `rails generate aloha:install`. Use `--coffee` option to use CoffeeScript for js-config file.

2. Load Aloha Editor config file.
    * insert this in your layout: `<%= javascript_include_tag 'aloha-config' %>`
    * _or_ require it in your asset: `//= require 'aloha-config'`

3. Load dependencies (only [RequireJS](http://requirejs.org/) library is required now).
    * _to load them all using [Aloha Editor CDN](http://cdn.aloha-editor.org/)_, just write this in your layout: `<%= aloha_dependencies_cdn %>`;
    * _or_ you can _load a single dependency only via CDN_, i.e. `<%= aloha_requirejs_cdn %>`;
    * _or load them manually in your own manner..._, then see [Aloha Editor's website](http://aloha-editor.org/) to choose required dependencies' versions.

4. Load Aloha Editor:
    * _to load it via CDN asynchronously using RequireJS_, write in your layout: `<%= aloha_require_cdn %>`;
    * _to load it via CDN but without RequireJS_, write in your layout (you should _not_ load RequireJS library above): `<%= aloha_cdn %>`;
    * _to load it from local server using RequireJS_, run `rake aloha:update` and write in your layout: `<%= aloha_require_local %>`;
    * _to load it from local server but without RequireJS_, run `rake aloha:update` and write in your layout (you should _not_ load RequireJS library above): `<%= aloha_local %>`;

5. Then write javascript to start edit a textarea: `$('#some-textarea').aloha();`.

Enjoy too!

## Additional information

See code (and tests) for aditional information.

## Testing

Run `rake spec` to test. See tests in `spec/` directory. You should use Rake 10+ and RSpec 2.12 to test.

## See Also

* [Aloha Editor website](http://aloha-editor.org/)

## Bugs List

## ToDo List

  * Generator tests.
  * Asset pipeline integration.
  * Automatically checking of the latest Aloha Editor's version.
  * Hooks (i.e. `Aloha.onReady`).
  * Plugins and their config.
  * Make Travis, Badges, etc.

## Bugs and Feedback

Follow to [Github](http://github.com/kuraga/aloha-rails-improved/issues).

## Contributing

We encourage you to contribute! [Join us on Github](http://github.com/kuraga/aloha-rails-improved)!

Note: [Master branch](http://github.com/kuraga/aloha-rails-improved/tree/master) has a latest stable version of Aloha::Rails::Improved.
Recent changes are in [develop branch](http://github.com/kuraga/aloha-rails-improved/tree/develop).

## License

Aloha::Rails::Improved is released under the [MIT License](http://www.opensource.org/licenses/MIT).

&copy; 2013 Kurakin Alexander (<kuraga333@mail.ru>).

<http://github.com/kuraga/aloha-rails-improved>
