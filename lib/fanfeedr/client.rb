module Fanfeedr
  
  class Client
    include HTTParty
    base_uri "http://api.fanfeedr.com"
    
    attr_reader :api_key
    attr_reader :api_type
                
    def initialize(options={})
      @api_key = options[:api_key] || Fred.api_key
      @api_type = options[:api_type] || Fred.api_type
    end

    def geo_feed(options={})
      response = self.class.get("/#{@api_type}/geo_feed", :query => options.merge(self.default_options), :format => :xml)["response"]["result"]["doc"]
    end

    def schedule(options={})
      response = self.class.get("/#{@api_type}/schedule", :query => options.merge(self.default_options), :format => :json)
    end
    
    def suggest(options={})
      response = self.class.get("/#{@api_type}/suggest", :query => options.merge(self.default_options), :format => :json)
    end
    
    def search(options={})
      response = self.class.get("/#{@api_type}/search", :query => options.merge(self.default_options), :format => :json)
    end
    
    def all_scores(options={})
      response = []
      results = self.class.get("/#{@api_type}/all_scores", :query => options.merge(self.default_options), :format => :xml)["response"]["result"]["doc"]
      
      results.each do |r|
        score_details = CGI::parse(r['str'][0])
        response << score_details
      end

      response
    end

    def scores(options={})
      response = []
      results = self.class.get("/#{@api_type}/scores", :query => options.merge(self.default_options), :format => :xml)["response"]["result"]["doc"]
      
      results.each do |r|
        score_details = CGI::parse(r['str'][0])
        response << score_details
      end

      response
    end

    def resource_feed(options={})
      response = self.class.get("/#{@api_type}/resource_feed", :query => options.merge(self.default_options), :format => :json)["docs"]
    end

    def get_article(options={})
      response = self.class.get("/#{@api_type}/get_article", :query => options.merge(self.default_options))      
    end

    def recap(options={})
      response = self.class.get("/#{@api_type}/recap", :query => options.merge(self.default_options))      
    end

    def boxscore(options={})
      response = self.class.get("/#{@api_type}/boxscore", :query => options.merge(self.default_options), :format => :json)      
    end
    
    protected
    
    def default_options
      {:api_key => @api_key}
    end
    
  end
end
