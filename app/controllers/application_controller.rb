class ApplicationController < ActionController::Base
  protect_from_forgery

  def twitter_client
  	Twitter::REST::Client.new do |config|
	  config.consumer_key        = "VwYcXK8yp46kcQe5mJHYmnweX"
	  config.consumer_secret     = "NuJMNryLUYjRM6Y0V4tqwrdUAImyN5GZOOTAqXfPZsJKvpQ2Rx"
	  config.access_token        = "347682994-KuHMkg3jVfjCmEhiemVd2k63iyMv4DcsO0MJVZ9K"
	  config.access_token_secret = "WhXDRz6ZLE78q7I3fEWF44xJmcJ7EAP1Or6k3q6T46tg9"
	end
  end	
end
