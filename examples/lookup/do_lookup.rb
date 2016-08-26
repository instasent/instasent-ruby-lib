$LOAD_PATH << '.'
require 'instasent'

client = Instasent::Client.new('my-token')
response = client.do_lookup('+346666666666')

puts response['response_body']
puts response['response_code']