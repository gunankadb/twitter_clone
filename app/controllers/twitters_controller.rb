class TwittersController < ApplicationController 
  protect_from_forgery

  def home
  	if params[:handle]
  		@tweets = twitter_client.user_timeline(params[:handle])
  	else	
  		@tweets = twitter_client.user_timeline("casetabs")
  	end	
  end

  def hash
  	if params[:handle]
  		@tweets = twitter_client.search("##{params[:handle]}",:result_type => "recent").take(20)
  	end	
  	render action: :home
  end

  def search
  	if params[:search]
  		@tweets = twitter_client.search("#{params[:search]}",:result_type => "recent").take(20)
  	end	
  	render action: :home
  end
end