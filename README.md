Welcome to __Instasent Ruby SDK__. This repository contains Ruby SDK for Instasent's REST API.

# Notice!

> **Verify** product is currently deprecated and will be removed in the next release. The same functionality can be easily implemented by sending an SMS. If you need help migrating please contact usage

## Installation

The easiest way to install the SDK is via gem:

```
gem install instasent
```

And then execute:

```
bundle
```

or including the following in your Gemfile:

```
gem 'instasent'
```

# Usage

Check the [examples directory](https://github.com/instasent/instasent-ruby-lib/tree/master/examples) to see working examples of this SDK usage

### Sending an SMS

```ruby
require 'instasent'

client = Instasent::Client.new('my-token')

response = client.send_sms('Company', '+34666666666', 'test message')

puts response['response_code']
puts response['response_body']
```

If you want to send an Unicode SMS (i.e with 😀 emoji) you only need to replace `send_sms` call to `send_sms_unicode`

```ruby
response = client.send_sms_unicode('Company', '+34666666666', 'Unicode test: ña éáíóú 😀')
```

## Available actions

```
SMS
client.send_sms(sender, to, text)
client.send_sms_unicode(sender, to, text)
client.get_sms(page, per_page)
client.get_sms_by_id(message_id)

LOOKUP
client.do_lookup(to)
client.get_lookup_by_id(id)
client.get_lookups(page, per_page)

ACCOUNT
client.get_account_balance()
```

# Full documentation

Full documentation of the API can be found at http://docs.instasent.com/

# Getting help

If you need help installing or using the SDK, please contact Instasent Support at support@instasent.com

If you've instead found a bug in the library or have a feature request, go ahead and open an issue or pull request!
