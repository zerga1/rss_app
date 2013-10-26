class RssController < ApplicationController
	def index
	end

	def update
		FeedEntry.update_from_feed("http://www.nb1.hu/rss.xml")
		redirect_to root_url
	end
end
