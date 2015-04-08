require_relative('lib/bootstrap')

require 'escher'
require 'net/http'


escher = Escher::Auth.new('example/credential/scope', {})

request_data = {
    method: 'GET',
    uri: '/',
    headers: [['Content-Type', 'application/json'], ['host', 'localhost']]
}

escher.sign!(request_data, Escher::Keypool.new.get_active_key('escherexample'))

request = Net::HTTP::Get.new('/')
request_data[:headers].each do |header|
  request[header.first] = header.last
end

response = Net::HTTP.new('localhost', '9292').request(request)

puts response.body