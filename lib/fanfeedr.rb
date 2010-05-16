# Fanfeedr
require 'rubygems'
gem 'httparty'
require 'httparty'

directory = File.expand_path(File.dirname(__FILE__))

module Fanfeedr
  
  # create config/initializers/fanfeedr.rb
  # 
  # Fanfeedr.configure do |config|
  #   config.api_key = 'api_key'
  #   config.api_type = 'api_type'
  # end
  # client = Fanfeedr::Client.new
  #
  # or
  #
  # Fanfeedr.api_key = 'api_key'
  # Fanfeedr.api_type = 'api_type'
  #
  # or
  #
  # Fanfeedr::Client.new(:api_key => 'api_key', :api_type => 'api_type')
  
  def self.configure
    yield self
    true
  end

  class << self
    attr_accessor :api_key
    attr_accessor :api_type
  end
  
end

require File.join(directory, 'fanfeedr', 'client')
