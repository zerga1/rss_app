class RssController < ApplicationController
	#http_basic_authenticate_with name: "test", password: "pass", except: :update
	def index
	  authenticate_or_request_with_http_basic('Administration') do |username, password|
      md5_of_password = Digest::MD5.hexdigest(password)
      username == 'admin' && md5_of_password == '5ebe2294ecd0e0f08eab7690d2a6ee69'
	end
end

	def update
		#FeedEntry.update_from_feed("http://www.nb1.hu/rss.xml")
		FeedEntry.update_from_feed("http://www.nemzetisport.hu/static/rss_hirek.xml")
		redirect_to root_url
	end
end
