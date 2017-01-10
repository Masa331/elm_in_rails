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

Put your regular Elm files in `app/assets/javascripts` directory and require Elm files in `application.js` manifest as you would require other JS files.

If you have any dependencies in you Elm files they will compile allright but in order to recompile on any change in them you need to state all dependencies explicitly in the Main file.
I hope this is bearable for small projects. If you can't do this please let me know or open pull request.

This is how some application.js with Elm files could look like.
```
....
//
//= require jquery
//= require jquery_ujs
//= require Main
```

This is how Main.elm file looks with dependency explicitly stated with Sprockets directive:
```
....
--= depend_on Dependency

module Main exposing (..)

import Html exposing (..)
...
```

And lastly, somewhere in views:
```
<div id="elm-container">
</div>

<script type="text/javascript" charset="utf-8">
  var node = document.getElementById('elm-container');
  var app = Elm.Main.embed(node)
</script>

```

Also, you have to `elm package install` inside your `app/assets/javascripts`. It will add `elm-package.json` and `elm-stuff` directory where compilation will happen. I suggest to add `elm-stuff` in your gitignore.

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
