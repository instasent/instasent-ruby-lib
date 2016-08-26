$LOAD_PATH << '.'
require 'instasent'

client = Instasent::Client.new('my-token')
response = client.get_lookup_by_id('id')

puts response['response_body']
puts response['response_code']