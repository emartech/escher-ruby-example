require 'escher'
require 'webrick'

escher = Escher.new('escher_request', {})

# noinspection RubyStringKeysInHashInspection
def key_db
  {
    "EscherExample" => "TheBeginningOfABeautifulFriendship",
  }
end

server = WEBrick::HTTPServer.new :Port => 8080

trap 'INT' do server.shutdown end

server.mount_proc '/' do |req, res|
  res.body = "Escher Example"
end

server.mount_proc '/validate_request' do |req, res|
  begin
    escher.validate(req, key_db)
    res.body = "OK"
  rescue EscherError => e
    res.body = "ERR: " + e.message
  end
end

server.start