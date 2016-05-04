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
  		cache(@tweets, :expires_in => 5.minutes) do 
  			@tweets = twitter_client.search("##{params[:handle]}")
  		end	
  	end	
  	render action: :home
  end

  def search
  	if params[:search]
  		cache(@tweets, :expires_in => 5.minutes) do 
  			@tweets = twitter_client.search("#{params[:search]}")
  		end	
  	end	
  	render action: :home
  end
end