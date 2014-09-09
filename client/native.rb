require 'escher'
require 'net/http'

escher = Escher.new('escher_request', {})
client = {api_key_id: "EscherExample", api_secret: "TheBeginningOfABeautifulFriendship"}

url = URI.parse('http://localhost:8080/validate_request')
req = Net::HTTP::Get.new(url.to_s)
req = escher.sign!(req, client)
res = Net::HTTP.start(url.host, url.port) {|http|
  http.request(req)
}
puts res.body