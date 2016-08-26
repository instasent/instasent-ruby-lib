$LOAD_PATH << '.'
require 'instasent'

client = Instasent::Client.new('my-token')
response = client.get_lookups(1, 10)

puts response['response_body']
puts response['response_code']