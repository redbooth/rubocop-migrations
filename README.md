# RuboCop Migrations

Rails migrations analysis as a extension of [RuboCop](https://github.com/bbatsov/rubocop). Heavily inspired by [`rubocop-cask`](https://github.com/caskroom/rubocop-cask) which in turn is inspired by [`rubocop-rspec`](https://github.com/nevir/rubocop-rspec).

## Installation

Just install the `rubocop-migrations` gem

```bash
gem install rubocop-migrations
```

or if you use bundler put this in your `Gemfile`

```ruby
gem 'rubocop-migrations'
```


## Usage

You need to tell RuboCop to load the Migrations extension. There are three ways to do this:

### RuboCop configuration file

Put this into your `.rubocop.yml`:

```yaml
require: rubocop/migrations
```

Now you can run `rubocop` and it will automatically load the RuboCop Migrations cops together with the standard cops.

### Command line

```bash
rubocop --require rubocop/migrations
```

## The Cop

All cops are located under [`lib/rubocop/cop/migrations`](lib/rubocop/cop/migrations), and contain examples/documentation.

In your `.rubocop.yml`, you may treat the Cask cops just like any other cop. For example:

```yaml
Migrations/RemoveIndex:
  Enabled: false
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

For running the spec files, this project depends on RuboCop's spec helpers. This means that in order to run the specs locally, you need a (shallow) clone of the RuboCop repository:

```bash
git submodule update --init --depth 1 vendor/rubocop
```

## License

`rubocop-migrations` is MIT licensed. [See the accompanying file](MIT-LICENSE.md) for
the full text.
