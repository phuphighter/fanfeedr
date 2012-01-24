# Fanfeedr

This is a Ruby wrapper for the [Fanfeedr API](http://developer.fanfeedr.com/).

## Installation

As a gem:

    sudo gem install fanfeedr

In a gemfile:

    gem 'fanfeedr'
    
## Get a Fanfeedr API key

Sign up for a Fanfeedr API key: [http://developer.fanfeedr.com/page/API_Plans_and_Pricing](http://developer.fanfeedr.com/page/API_Plans_and_Pricing)
    
## Usage

### Instantiate a client

    >> @client = Fanfeedr::Client.new(:api_key => 'your_api_key', :tier => 'your_tier')
    
#### Examples
    
    >> @leagues = @client.leagues(:id => "20f0857f-3c43-5f50-acfc-879f838ee853")
    >> @leagues.size
    => 45

    >> @client.leagues(:id => "20f0857f-3c43-5f50-acfc-879f838ee853")
    => {"sport"=>"Baseball", "name"=>"MLB", "gender"=>"M", "id"=>"20f0857f-3c43-5f50-acfc-879f838ee853", "levels"=>["professional"]}

    >> @client.conferences(:id => "384fbe7c-7694-51e8-bf0a-7d0d63ba9211", :parent_resource => "leagues", :resource_id => "20f0857f-3c43-5f50-acfc-879f838ee853")
    => {"id"=>"384fbe7c-7694-51e8-bf0a-7d0d63ba9211", "level"=>"professional", "name"=>"National League"}
    
## Copyright

Contact me if you have any suggestions and feel free to fork it!

Copyright (c) 2012 Johnny Khai Nguyen, released under the MIT license
