# Fanfeedr

This is a Ruby wrapper for the [Fanfeedr API](http://developer.fanfeedr.com/).

## Installation

In your Rails directory:

    script/plugin install git://github.com/phuphighter/fanfeedr.git
    
## Get a Fanfeedr API key

Sign up for a Fanfeedr API key: [http://developer.fanfeedr.com/member/register](http://developer.fanfeedr.com/member/register)
    
## Usage

### Instantiate a client

    >> fanfeedr = Fanfeedr::Client.new(:api_key => 'your_api_key', :api_type => 'your_api_type')
    
### or configure once

    >> Fanfeedr.configure do |config|
    >>   config.api_key = 'your_api_key'
    >>   config.api_type = 'your_api_type'
    >> end
    >> fanfeedr = Fanfeedr::Client.new
    
#### Examples

    >> fanfeedr.scores(:resource => "team://mlb/texas_rangers", :rows => '2')
    => [{"defaultdict(<type 'str'>, {'eventlink': u'event://mlb/2010/05/15/games/texas_rangers_toronto_blue_jays', 'winteamlocationshort': u'Toronto', 'loseteamlogo': u'/img/teams/small/texas_rangers_25.png', 'is_college': u'False', 'loseteamlocation': u'Texas', 'winteamname': u'Blue Jays', 'loseteamfullname': u'Rangers', 'sport': u'Baseball', 'winscore': u'6', 'league': u'league://mlb', 'losescore': u'0', 'loseteamlink': u'team://mlb/texas_rangers', 'loseteamlocationshort': u'Texas', 'season_type': u'None', 'winteamfullname': u'Blue Jays', 'winteamlink': u'team://mlb/toronto_blue_jays', 'season_year': u'None', 'winteamlogo': u'/img/teams/small/toronto_blue_jays_25.png', 'winteamhomeaway': u'A', 'winteamlocation': u'Toronto', 'loseteamname': u'Rangers'})"=>[nil]}]
    
    >> fanfeedr.schedule(:resource => "team://nba/boston_celtics")
    => [{"name"=>"Boston Celtics @ Orlando Magic", "time"=>"20:30:00", "date"=>Sun, 30 May 2010, "away"=>{"winlose"=>nil, "team"=>"team://nba/boston_celtics", "score"=>nil}, "status"=>nil, "home"=>{"winlose"=>nil, "team"=>"team://nba/orlando_magic", "score"=>nil}, "resource_text"=>"event://nba/2010/05/30/games/boston_celtics_orlando_magic"}]

## Copyright

Contact me if you have any suggestions and feel free to fork it!

Copyright (c) 2009 Johnny Khai Nguyen, released under the MIT license
