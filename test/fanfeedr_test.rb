require 'helper'

class FanfeedrTest < Test::Unit::TestCase
  
  context "Fanfeedr API" do
    
    setup do
      @client = Fanfeedr::Client.new(:api_key => 'fanfeedr_key', :api_type => 'daily')
    end

    context "get geofeed" do
      should "return geofeed results for a specific location" do
        stub_get("http://api.fanfeedr.com/daily/geo_feed?appid=fanfeedr_key&lat=42.1497&long=-74.9284", "geo_feed.xml")
        geofeed_result = @client.geo_feed(:lat => '42.1497', :long => '-74.9284')
        geofeed_result.first["str"][2].should == 'source://la_times/sports'
        geofeed_result.first["str"][7].should == 'LA Times'
      end
    end
    
    context "get schedules" do
      should "return schedule for a specific resource" do
        stub_get("http://api.fanfeedr.com/daily/schedule?resource=team%3A%2F%2Fncaa_football%2Foklahoma_st_cowboys&format=json&appid=fanfeedr_key", "schedule.json")
        schedule_result = @client.schedule(:resource => 'team://ncaa_football/oklahoma_st_cowboys')
        schedule_result.first["name"].should == 'Georgia Bulldogs @ Oklahoma St Cowboys'
        schedule_result.last["name"].should == 'Oklahoma St Cowboys @ Ole Miss Rebels'
      end
    end


    # add more tests!
  end

end