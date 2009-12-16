# Fanfeedr
require 'rubygems'
gem 'httparty'
require 'httparty'

module Fanfeedr

	def self.geo_feed(longitude, latitude)
    response = HTTParty.get("http://api.fanfeedr.com/#{FANFEEDR_API_TYPE}/geo_feed?long=#{longitude}&lat=#{latitude}&appid=#{FANFEEDR_APPLICATION_ID}", :format => :xml)["response"]["result"]["doc"]
	end

	def self.schedule(league, team)
		response = HTTParty.get("http://api.fanfeedr.com/#{FANFEEDR_API_TYPE}/schedule?resource=team://#{league}/#{team}&appid=#{FANFEEDR_APPLICATION_ID}", :format => :json)
	end
	
	def self.team_scores(league, team)
    response = []
    results = HTTParty.get("http://api.fanfeedr.com/#{FANFEEDR_API_TYPE}/scores?resource=team://#{league}/#{team}&appid=#{FANFEEDR_APPLICATION_ID}", :format => :xml)["response"]["result"]["doc"]

    results.each do |r|
      score_details = CGI::parse(r['str'][0])
      response << score_details
    end

    response
	end

	def self.league_scores(league)
    response = []	
    results = HTTParty.get("http://api.fanfeedr.com/#{FANFEEDR_API_TYPE}/scores?resource=league://#{league}&appid=#{FANFEEDR_APPLICATION_ID}", :format => :xml)["response"]["result"]["doc"]

    results.each do |r|
      score_details = CGI::parse(r['str'][0])
      response << score_details
    end

    response
	end
	
	def self.team_feed(league, team)
		response = HTTParty.get("http://api.fanfeedr.com/#{FANFEEDR_API_TYPE}/resource_feed?resource=team://#{league}/#{team}&n&appid=#{FANFEEDR_APPLICATION_ID}&format=json", :format => :json)["docs"]
	end

	def self.league_feed(league)	
		response = HTTParty.get("http://api.fanfeedr.com/#{FANFEEDR_API_TYPE}/resource_feed?resource=league://#{league}&appid=#{FANFEEDR_APPLICATION_ID}&format=json", :format => :json)["docs"]
	end
	
	def self.get_article(resource)	
		response = HTTParty.get("http://api.fanfeedr.com/#{FANFEEDR_API_TYPE}/get_article?resource=article://#{resource}&appid=#{FANFEEDR_APPLICATION_ID}")
	end
	
	def self.recap(event_resource)	
		response = HTTParty.get("http://api.fanfeedr.com/#{FANFEEDR_API_TYPE}/recap?resource=#{event_resource}&appid=#{FANFEEDR_APPLICATION_ID}")
	end
	
	def self.boxscore(event_resource)	
		response = HTTParty.get("http://api.fanfeedr.com/#{FANFEEDR_API_TYPE}/boxscore?resource=#{event_resource}&appid=#{FANFEEDR_APPLICATION_ID}&format=json", :format => :json)
	end
	
	def self.schedule_resource(resource_path)
		response = HTTParty.get("http://api.fanfeedr.com/#{FANFEEDR_API_TYPE}/schedule?resource=#{resource_path}&appid=#{FANFEEDR_APPLICATION_ID}", :format => :json)
	end
	
	def self.scores_resource(resource_path)
    response = []
    results = HTTParty.get("http://api.fanfeedr.com/#{FANFEEDR_API_TYPE}/scores?resource=#{resource_path}&appid=#{FANFEEDR_APPLICATION_ID}", :format => :xml)["response"]["result"]["doc"]

    results.each do |r|
      score_details = CGI::parse(r['str'][0])
      response << score_details
    end

    response
	end
	
	def self.resource_feed(resource_path)
		response = HTTParty.get("http://api.fanfeedr.com/#{FANFEEDR_API_TYPE}/resource_feed?resource=#{resource_path}&n&appid=#{FANFEEDR_APPLICATION_ID}&format=json", :format => :json)["docs"]
	end

end
