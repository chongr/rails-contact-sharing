require 'addressable/uri'
require 'rest-client'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users/3'
).to_s
#
# query_url = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/users.html',
#   query_values: {
#     'var1' => 'val1',
#     'var2' => 'val2'
#   }
# ).to_s

# puts RestClient.get(url)
# puts RestClient.get(query_url)
# puts RestClient.post(url, param1: "hi")

def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

  puts RestClient.post(
    url,
    { user: { name: 'Gizmo1', email: 'gizmo1@gizmo.gizmo' } }
  )
end

puts RestClient.delete(url)
