$LOAD_PATH << '.'
require 'instasent'

client = Instasent::Client.new('my-token')
response = client.get_account_balance()

puts response['response_body']
puts response['response_code']