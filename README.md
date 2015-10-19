[![Build Status](https://travis-ci.org/maartenvanvliet/ruby-todoist-api.svg)](https://travis-ci.org/maartenvanvliet/ruby-todoist-api)

# Todoist::Api

Gem to wrap the Todoist Api v6 as described on https://developer.todoist.com/

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'todoist-api', git: 'https://github.com/maartenvanvliet/ruby-todoist-api', branch: 'master', require: 'todoist'

```

And then execute:

    $ bundle

## Usage

    todoist = Todoist::Client.new(todoist_token)
    todoist.items.create(content: 'Some new todo')
    todoist.process_queue

## Contributing

1. Fork it ( https://github.com/[my-github-username]/todoist-api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
