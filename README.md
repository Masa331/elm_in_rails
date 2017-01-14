# ElmInRails

This is a very simple glue for using Elm in Rails 5 asset pipeline.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'elm_in_rails'
```

And then execute:

    $ bundle

You also have to have Elm compiler installed through NPM on your system. Look here for official install guide:
[elm-lang.org](http://elm-lang.org/)

## Usage

Install Elm package in `app/assets/javascripts` and put all your Elm files there. The compilation will happen in `elm-stuff` which i suggest to put into your gitignore.

Now require Elm files in `application.js` manifest as you would require other JS files:

```
....
//
//= require jquery
//= require jquery_ujs
//= require Main
```

And now somewhere in views:
```html
<div id="elm-container">
</div>

<script type="text/javascript" charset="utf-8">
  var node = document.getElementById('elm-container');
  var app = Elm.Main.embed(node)
</script>

```

### Dependency changes tracking

If your Elm files have any dependencies they should be automatically tracked by Sprockets and recompilation on change should work out of box. It's currently implemented very simply - all Elm files in same directory or subdirectories are watched for changes.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Masa331/elm_in_rails.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Links and Thanks :heart:

- [New Rails 5 + Elm gem](https://github.com/NoRedInk/npm-elm-rails)
- [Old Elm + Rails 3.2 gem](https://github.com/NoRedInk/elm_sprockets)
- [Gist for integrating Elm in Rails 4.2](https://gist.github.com/tmichel/4ac68024b30b77594dac) - I think this should work with Rails 5 with little tweaking
- [Other gist for older Rails intergation 1](https://gist.github.com/rtfeldman/db7b121100b6c6ff435b)
- [Other gist for older Rails intergation 2](https://gist.github.com/rtfeldman/e191ee54cc00f8632ade)
- [Gem with Elm compiler 1](https://github.com/eunomie/ruby-elm)
- [Gem with Elm compiler 2](https://github.com/fbonetti/ruby-elm-compiler)
