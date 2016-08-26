$LOAD_PATH << '.'
require 'instasent'

client = Instasent::Client.new('my-token')
response = client.check_verify('id', 'token')

puts response['response_body']
puts response['response_code']