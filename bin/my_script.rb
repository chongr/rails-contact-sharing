require 'addressable/uri'
require 'rest-client'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users/1'
).to_s

query_url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users.html',
  query: 'var1=val1'
).to_s

puts RestClient.get(url)
# puts RestClient.get(query_url)
# puts RestClient.post(url, param1: "hi")
