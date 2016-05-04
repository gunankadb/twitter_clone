module ApplicationHelper
	def render_with_hashtags(text)
	  text1 = text.gsub(/(?:@(\w+))/) {handle_link($1)}
	  text2 = text1.gsub(/(?:#(\w+))/) {hashtag_link($1)}
	end
	def hashtag_link(hash)
	  link_to "##{hash}", hash_twitters_path(handle: hash)
	end

	def handle_link(handle)
	    link_to("@#{handle}" , home_twitters_path(handle: handle), :class => "popover-twitter", :rel => "popover", :"data-placement" => "bottom", :title => "#{handle}", :"data-content" => "#{render 'twitter_modal', :handle => handle}", :"data-target" => 'modal_id') 	
	end

	def twitter_client
	  	Twitter::REST::Client.new do |config|
		  config.consumer_key        = "VwYcXK8yp46kcQe5mJHYmnweX"
		  config.consumer_secret     = "NuJMNryLUYjRM6Y0V4tqwrdUAImyN5GZOOTAqXfPZsJKvpQ2Rx"
		  config.access_token        = "347682994-KuHMkg3jVfjCmEhiemVd2k63iyMv4DcsO0MJVZ9K"
		  config.access_token_secret = "WhXDRz6ZLE78q7I3fEWF44xJmcJ7EAP1Or6k3q6T46tg9"
		end
	end
end
