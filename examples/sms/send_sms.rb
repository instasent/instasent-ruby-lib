$LOAD_PATH << '.'
require 'instasent'

client = Instasent::Client.new('my-token')
response = client.send_sms('My company', '+34666666666', 'test message')

puts response['response_body']
puts response['response_code']