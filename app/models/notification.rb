class Notification < ApplicationRecord
	require 'net/http'


	def self.send_notification(params)
		uri = URI.parse('https://onesignal.com/api/v1/notifications')
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		request = Net::HTTP::Post.new(uri.path,header)
		request.body = body(params[:tokens],params[:message]).as_json.to_json
		response = http.request(request) 
		puts response.body
	end

	def self.header
		{"Content-Type" => "application/json; charset=utf-8",
				"Authorization" => "Basic MDcwNGM1NDktNDU3My00MDc5LWIzMDQtNDdkZDg1MWUzNGIz"
			}
	end

	def self.body(tokens,message)
		{
			"app_id" => "31f52373-1d4a-4f3a-b24f-4a731950aa60", 
      		"contents" => {"en" => message},
      		"include_ios_tokens" => tokens
		}
	end

end
