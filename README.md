# Snag

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'snag'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install snag

## Usage

Grab some files:

```bash
snag
```

Update some files:

```bash
snag update
```

Restart your file state:

```bash
snag clobber
```

Everything is based around Snagfiles.  A Snagfile is just a Ruby DSL which describes a bunch of files in different locations, and what to do with them.  

### You can declare desired snag dependencies with a Snagfile

```ruby
Snag.depends(on: 'esmevane/sojourn') do
  move 'app/scripts/application.min.js', to: 'app/assets/javascripts/app.min.js'
  move 'app/styles', to: 'app/assets/stylesheets'
  move 'app/images', to: 'app/assets/images'
end
```

### You can expose files to remote snags with a Snagfile

This builds up a yes/no list for remote snags.  Remote Snagfiles can declare their own dependencies, which take priority over this.  In other words, if you don't explicitly expose files with a Snagfile, you can still remotely snag them.

```ruby
Snag.expose do
  glob in: 'app/scripts/**/*.min.js', as: 'minified_scripts'

  everything in: 'app/styles',  as: 'styles'
  everything in: 'app/images',  as: 'images'
end
```

When an expose Snagfile is made, then snag clients can upgrade their dependency rules.  Notice that `:as` declaration on each line.  This becomes a named resource which remote clients can access.

```ruby
# A remote Snagfile

Snag.depends(on: 'esmevane/sojourn') do
  move :minified_scripts, to: 'app/assets/javascripts'

  move :images, to: 'app/assets/images'
  move :styles, to: 'app/assets/stylesheets'
end
```

### You can snag files from private repositories

But Snag will need to get your Oauth token to do it.  Just for the sake of stating it out loud, you can only snag from private repositories you have access to.

### You don't need to publish registries to snag

Some source file distributors spend a good amount of time creating a toolkit which requires publication of file definitions to a public registry.  That sort of thing tends to be an added (unnecessary) complexity to deal with.

Snag just uses Github.  It has no other registry dependencies.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/snag. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
