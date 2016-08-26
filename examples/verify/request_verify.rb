$LOAD_PATH << '.'
require 'instasent'

client = Instasent::Client.new('my-token')
response = client.request_verify('My company', '+346666666666', 'Your code is %token%')

puts response['response_body']
puts response['response_code']