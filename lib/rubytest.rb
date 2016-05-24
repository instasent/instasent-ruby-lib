$LOAD_PATH << '.'
require 'instasent'

hola = Instasent::Client.new('asdf')
# puts hola.get_sms_by_id('573c8c7f1e9ee37ba3383c71')
puts hola.send_sms('Mi empresa', '+34666571874', 'Prueba Ruby')

