$LOAD_PATH << '.'
require 'instasent'

hola = Instasent::Client.new('733236dcb9bd0ff42667745c62f0b722fc494757')
# puts hola.get_sms_by_id('573c8c7f1e9ee37ba3383c71')
puts hola.send_sms('Mi empresa', '+34666571874', 'Prueba Ruby')

