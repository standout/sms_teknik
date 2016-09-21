# SmsTeknik

Need to send an SMS with [SMS Teknik](http://www.smsteknik.se)? Then this is the Gem for you. We only implemented the gateway calls we need for now. But keep in mind that it's open source and you can help us improve the gem and make it more feature complete.

This gem is created by [Standout AB](http://standout.se).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sms_teknik'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sms_teknik

## Usage

You need to contact [SMS Teknik](http://www.smsteknik.se) to get an account.

### Send a SMS

```ruby
id = "Your company ID"
user = "your user name"
pass = "your password"
sender = "FOO"
client = SmsTeknik::Client.new(id: id, user: user, pass: pass)
sms = SmsTeknik::Message(from: sender, to: ["+700000000"], body: "Hello, World!")

client.deliver(sms)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/sms_teknik. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

