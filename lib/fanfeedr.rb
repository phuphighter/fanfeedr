# Fanfeedr
require 'rubygems'
gem 'httparty'
require 'httparty'

module Fanfeedr

	def self.schedule(league, team)
		response = HTTParty.get("http://api.fanfeedr.com/schedule?resource=team://#{league}/#{team}&appid=zpeyk4taevn7rc9en7j34zc4", :format => :json)
	end
	
	def self.team_scores(league, team)
    response = []
		results = HTTParty.get("http://api.fanfeedr.com/scores?resource=team://#{league}/#{team}&appid=zpeyk4taevn7rc9en7j34zc4", :format => :xml)["response"]["result"]["doc"]

    results.each do |r|
      score_details = CGI::parse(r['str'][0])
      response << score_details
    end

    response
	end

	def self.league_scores(league)
    response = []	
		results = HTTParty.get("http://api.fanfeedr.com/scores?resource=league://#{league}&appid=zpeyk4taevn7rc9en7j34zc4", :format => :xml)["response"]["result"]["doc"]

    results.each do |r|
      score_details = CGI::parse(r['str'][0])
      response << score_details
    end

    response
	end
	
	def self.team_resource_feed(league, team)
		response = HTTParty.get("http://api.fanfeedr.com/resource_feed?resource=team://#{league}/#{team}&n&appid=zpeyk4taevn7rc9en7j34zc4&format=json", :format => :json)
	end

	def self.league_resource_feed(league)	
		response = HTTParty.get("http://api.fanfeedr.com/resource_feed?resource=league://#{league}&appid=zpeyk4taevn7rc9en7j34zc4&format=json", :format => :json)
	end
	
	def self.get_article(resource)	
		response = HTTParty.get("http://api.fanfeedr.com/get_article?resource=article://#{resource}&appid=zpeyk4taevn7rc9en7j34zc4")
	end

end
