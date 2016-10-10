
# Actionpack::Cloudflare

[![Build Status](https://travis-ci.org/customink/actionpack-cloudflare.svg?branch=master)](https://travis-ci.org/customink/actionpack-cloudflare)

Simple gem that extends Rails `request.remote_ip` to default to Cloudflare's `HTTP_CF_CONNECTING_IP` header. More about [CloudFlare HTTP Headers](https://support.cloudflare.com/hc/en-us/articles/200170986-How-does-CloudFlare-handle-HTTP-Request-headers-) and why we choose to trust `CF-Connecting-IP`.


## Installation

Add this line to your Rails application's Gemfile:

```ruby
gem 'actionpack-cloudflare'
```

## Usage

None! Just install and feel confident that `request.remote_ip` is doing its job.


## Alternatives


* [cloudflare-rails](https://github.com/modosc/cloudflare-rails) - Leverages cached HTTP requests to Cloudflare to extend Rails' trusted proxies list.


## Contributing

We use the [Appraisal](https://github.com/thoughtbot/appraisal) gem from Thoughtbot to help us test different versions of Rails. The `appraisal rake test` subcommand runs our test suite against all Rails versions in the `Appraisal` file. So after cloning the repo, running the following commands.

```shell
$ bundle install
$ bundle exec appraisal update
$ bundle exec appraisal rake test
```

If you want to run the tests for a specific appraisal, use one of the names found in our `Appraisal` file. For example, the following will run our tests suite for Rails 4.2 only.

```shell
$ bundle exec appraisal rails42 rake test
```


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

