module Fanfeedr
  
  class Client
    include HTTParty
    base_uri "http://ffapi.fanfeedr.com"
    
    attr_reader :api_key
    attr_reader :tier
                
    def initialize(options={})
      @api_key = options[:api_key] || Fanfeedr.api_key
      @tier = options[:tier] || Fanfeedr.tier
    end

    def leagues(options={})  
      id = options.delete(:id)
          
      if id
        response = self.class.get("/#{@tier}/api/leagues/#{id}", :query => options.merge(self.default_options), :format => :json)
      else
        response = self.class.get("/#{@tier}/api/leagues", :query => options.merge(self.default_options), :format => :json)
      end
    end
    
    def conferences(options={})
      id = options.delete(:id)
      parent_resource = options.delete(:parent_resource)
      resource_id = options.delete(:resource_id)
      
      if id
        response = self.class.get("/#{@tier}/api/#{parent_resource}/#{resource_id}/conferences/#{id}", :query => options.merge(self.default_options), :format => :json)
      else
        response = self.class.get("/#{@tier}/api/#{parent_resource}/#{resource_id}/conferences", :query => options.merge(self.default_options), :format => :json)
      end
    end
    
    def divisions(options={})
      id = options.delete(:id)      
      parent_resource = options.delete(:parent_resource)
      resource_id = options.delete(:resource_id)
      
      if id
        response = self.class.get("/#{@tier}/api/#{parent_resource}/#{resource_id}/divisions/#{id}", :query => options.merge(self.default_options), :format => :json)
      else
        response = self.class.get("/#{@tier}/api/#{parent_resource}/#{resource_id}/divisions", :query => options.merge(self.default_options), :format => :json)
      end
    end
    
    def teams(options={}, secondary=nil)
      id = options.delete(:id)
      parent_resource = options.delete(:parent_resource)
      resource_id = options.delete(:resource_id)
      
      if id && secondary.nil?
        response = self.class.get("/#{@tier}/api/#{parent_resource}/#{resource_id}/teams/#{id}", :query => options.merge(self.default_options), :format => :json)
      elsif id && !secondary.nil?
        response = self.class.get("/#{@tier}/api/#{parent_resource}/#{resource_id}/teams/#{id}/#{secondary}", :query => options.merge(self.default_options), :format => :json)  
      else
        response = self.class.get("/#{@tier}/api/#{parent_resource}/#{resource_id}/teams", :query => options.merge(self.default_options), :format => :json)
      end
    end
    
    def persons(options={})
      id = options.delete(:id)
      parent_resource = options.delete(:parent_resource)
      resource_id = options.delete(:resource_id)
      
      if id
        response = self.class.get("/#{@tier}/api/#{parent_resource}/#{resource_id}/persons/#{id}", :query => options.merge(self.default_options), :format => :json)
      else
        response = self.class.get("/#{@tier}/api/#{parent_resource}/#{resource_id}/persons", :query => options.merge(self.default_options), :format => :json)
      end
    end
    
    def geo(options={}, secondary=nil)
      id = options.delete(:id)
      
      if id && secondary.nil?
        response = self.class.get("/#{@tier}/api/geo/#{id}", :query => options.merge(self.default_options), :format => :json)
      elsif id && !secondary.nil?
        response = self.class.get("/#{@tier}/api/geo/#{id}/#{secondary}", :query => options.merge(self.default_options), :format => :json)  
      else
        response = self.class.get("/#{@tier}/api/geo", :query => options.merge(self.default_options), :format => :json)
      end
    end
    
    def events(options={}, secondary=nil)
      id = options.delete(:id)
      parent_resource = options.delete(:parent_resource)
      resource_id = options.delete(:resource_id)
      season_type = options.delete(:season_type) || nil      
      
      if id && secondary.nil?
        response = self.class.get("/#{@tier}/api/#{parent_resource}/#{resource_id}/events/#{id}", :query => options.merge(self.default_options), :format => :json)
      elsif id && !secondary.nil?
        response = self.class.get("/#{@tier}/api/#{parent_resource}/#{resource_id}/events/#{id}/#{secondary}", :query => options.merge(self.default_options), :format => :json)  
      elsif id.nil? && !secondary.nil?
        response = self.class.get("/#{@tier}/api/#{parent_resource}/#{resource_id}/events/#{secondary}", :query => options.merge(self.default_options), :format => :json)        
      elsif id.nil? && secondary.nil? && options[:season_type]
        response = self.class.get("/#{@tier}/api/#{parent_resource}/#{resource_id}/events/#{season_type}", :query => options.merge(self.default_options), :format => :json)        
      else
        response = self.class.get("/#{@tier}/api/#{parent_resource}/#{resource_id}/events", :query => options.merge(self.default_options), :format => :json)
      end
    end
    
    def content(options={}, secondary=nil)
      id = options.delete(:id)
      parent_resource = options.delete(:parent_resource)
      resource_id = options.delete(:resource_id)
      content_filter = options.delete(:filter) || nil
      
      if id && secondary.nil?
        response = self.class.get("/#{@tier}/api/#{parent_resource}/#{resource_id}/content/#{id}", :query => options.merge(self.default_options), :format => :json)
      elsif id && !secondary.nil?
        response = self.class.get("/#{@tier}/api/#{parent_resource}/#{resource_id}}/content/#{id}/#{secondary}", :query => options.merge(self.default_options), :format => :json)  
      elsif id.nil? && secondary.nil? && !content_filter.nil?
        response = self.class.get("/#{@tier}/api/#{parent_resource}/#{resource_id}/content/#{filter}", :query => options.merge(self.default_options), :format => :json)        
      else
        response = self.class.get("/#{@tier}/api/#{parent_resource}/#{resource_id}/content", :query => options.merge(self.default_options), :format => :json)
      end
    end
    
    def sources(options={})
      id = options.delete(:id)
      parent_resource = options.delete(:parent_resource)
      resource_id = options.delete(:resource_id)
      
      if id
        response = self.class.get("/#{@tier}/api/#{parent_resource}/#{resource_id}/sources/#{id}", :query => options.merge(self.default_options), :format => :json)
      else
        response = self.class.get("/#{@tier}/api/#{parent_resource}/#{resource_id}/sources", :query => options.merge(self.default_options), :format => :json)
      end
    end
    
    def trending(options={}, secondary=nil)
      parent_resource = options.delete(:parent_resource)
      resource_id = options.delete(:resource_id)
      
      if !secondary.nil?
        response = self.class.get("/#{@tier}/api/#{parent_resource}/#{resource_id}/#{secondary}", :query => options.merge(self.default_options), :format => :json)
      end
    end
    
    protected
    
    def default_options
      {:api_key => @api_key}
    end
    
  end
end
