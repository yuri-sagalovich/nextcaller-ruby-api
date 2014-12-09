require 'nextcaller_client'

username = 'XXXXX'
password = 'XXXXX'
sandbox = false
platform_username = 'user12345'

client = NextcallerClient::NextCallerPlatformClient.new(username, password, sandbox)

begin
  data = { email: 'test@test.com' } 
  response = client.update_platform_user(platform_username, data)
  puts response.class # Response is a object of Net::HTTPNoContent
  puts 'Success'
rescue ArgumentError => error
  puts error.message
rescue NextcallerClient::HttpException => error
  puts error.message
  puts error.content
end
# Output: 
# Net::HTTPNoContent
# Success