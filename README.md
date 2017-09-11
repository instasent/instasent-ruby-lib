Welcome to __Instasent Ruby SDK__. This repository contains Instasent's Ruby SDK and samples for REST API.

## Installation

The easiest way to install the instasent package is either via command line:

```
$ gem install instasent
```
And then execute:

    $ bundle
or including the following in your Gemfile:

```
gem 'instasent'
```

## Example
### Send an SMS
You can check 'examples/send-sms.rb' file.
```ruby
require 'instasent'

client = Instasent::Client.new('my-token')

response = client.send_sms('My company', '+34666666666', 'test message')

puts response['response_code']
puts response['response_body']
```
## Available functions
```
SMS
client.send_sms(sender, to, text)
client.get_sms(page, per_page)
client.get_sms_by_id(message_id)

VERIFY
client.request_verify(sender, to, text); // text must include %token% string
client.check_verify(id, token)
client.get_verify_by_id(id)
client.get_verify(page, per_page)

LOOKUP
client.do_lookup(to)
client.get_lookup_by_id(id)
client.get_lookups(page, per_page)

ACCOUNT
client.get_account_balance()
```
## Documentation
Complete documentation at :
[http://docs.instasent.com/](http://docs.instasent.com/).

# Getting help

If you need help installing or using the library, please contact Instasent Support at support@instasent.com first.
If you've instead found a bug in the library or would like new features added, go ahead and open issues or pull requests against this repo!