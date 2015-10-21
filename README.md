[![Build Status](https://travis-ci.org/maartenvanvliet/ruby-todoist-api.svg)](https://travis-ci.org/maartenvanvliet/ruby-todoist-api)

# Todoist::Api

Gem to wrap the Todoist Api v6 as described on https://developer.todoist.com/

*Note:* Until a more complete coverage of the all Todoist features is achieved the api is unstable and no semantic versioning will be applied. 

## Goals

* To provide an easy to use, well tested, wrapper for the Todoist Api
* Use a minimal set of dependencies apart from the Ruby standard library (exception for development dependencies, although also bare minimum).
* Ruby 2.1 and up


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'todoist-api', git: 'https://github.com/maartenvanvliet/ruby-todoist-api', branch: 'master', require: 'todoist'

```

And then execute:

    $ bundle install

## Usage

    todoist = Todoist::Client.new(todoist_token)
    todoist.items.create(content: 'Some new todo')
    todoist.process_queue

## Future

Possible spinoff would be a gem to do provide a CLI interface to Todoist.

## Contributing

1. Fork it ( https://github.com/maartenvanvliet/ruby-todoist-api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
