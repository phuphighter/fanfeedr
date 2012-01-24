require 'spec_helper'

describe Fanfeedr::Client do
  
  context 'requesting leagues' do
    use_vcr_cassette 'leagues'

    it 'should initialize with an api_key' do
      @client = Fanfeedr::Client.new(:api_key => "foobar", :tier => "basic")
      @client.api_key.should == "foobar"
    end

    it 'should return all leagues' do    
      @client = Fanfeedr::Client.new(:api_key => "foobar", :tier => "basic")
      @leagues = @client.leagues
      @leagues.size.should == 45
    end
    
    it 'should return one league' do    
      @client = Fanfeedr::Client.new(:api_key => "foobar", :tier => "basic")
      @league = @client.leagues(:id => "20f0857f-3c43-5f50-acfc-879f838ee853")
      @league.should == {"sport"=>"Baseball", "name"=>"MLB", "gender"=>"M", "id"=>"20f0857f-3c43-5f50-acfc-879f838ee853", "levels"=>["professional"]}
    end
  end
  
  context "requesting conferences" do
    use_vcr_cassette 'conferences'
    
    before do
      @client = Fanfeedr::Client.new(:api_key => "foobar", :tier => "basic")
    end
    
    it 'should return all conferences' do    
      @conferences = @client.conferences(:parent_resource => "leagues", :resource_id => "20f0857f-3c43-5f50-acfc-879f838ee853")
      @conferences.size.should == 2
    end
    
    it 'should return one conference' do    
      @conference = @client.conferences(:id => "384fbe7c-7694-51e8-bf0a-7d0d63ba9211", :parent_resource => "leagues", :resource_id => "20f0857f-3c43-5f50-acfc-879f838ee853")
      @conference.should == {"id"=>"384fbe7c-7694-51e8-bf0a-7d0d63ba9211", "level"=>"professional", "name"=>"National League"}
    end
  end
  
  context "requesting divisions" do
    use_vcr_cassette 'divisions'
    
    before do
      @client = Fanfeedr::Client.new(:api_key => "foobar", :tier => "basic")
    end
    
    it 'should return all divisions' do    
      @divisions = @client.divisions(:parent_resource => "leagues", :resource_id => "20f0857f-3c43-5f50-acfc-879f838ee853")
      @divisions.size.should == 6
    end
  end
  
  context "requesting teams" do
    use_vcr_cassette 'teams'
    
    before do
      @client = Fanfeedr::Client.new(:api_key => "foobar", :tier => "basic")
    end
    
    it 'should return all teams' do    
      @teams = @client.teams(:parent_resource => "leagues", :resource_id => "20f0857f-3c43-5f50-acfc-879f838ee853")
      @teams.size.should == 30
    end
  end
  
  context "requesting persons" do
    use_vcr_cassette 'persons'
    
    before do
      @client = Fanfeedr::Client.new(:api_key => "foobar", :tier => "basic")
    end
    
    it 'should return all persons' do    
      @persons = @client.persons(:parent_resource => "leagues", :resource_id => "20f0857f-3c43-5f50-acfc-879f838ee853")
      @persons.should_not be_nil
    end
  end
  
  context 'geo' do
    use_vcr_cassette 'geo'
    
    before do
      @client = Fanfeedr::Client.new(:api_key => "foobar", :tier => "basic")
    end

    it 'should return all geo with query' do    
      @geo = @client.geo(:q => "dallas")
      @geo.should_not be_nil
    end
  end
  
  context "requesting events" do
    use_vcr_cassette 'events'
    
    before do
      @client = Fanfeedr::Client.new(:api_key => "foobar", :tier => "basic")
    end
    
    it 'should return all events' do    
      @events = @client.events(:parent_resource => "leagues", :resource_id => "20f0857f-3c43-5f50-acfc-879f838ee853")
      @events.size.should == 2
    end
      
    it 'should return all events for today' do    
      @events = @client.events({:parent_resource => "leagues", :resource_id => "20f0857f-3c43-5f50-acfc-879f838ee853"}, "today")
      @events.should_not be_nil
    end
    
    it 'should return all events for next two weeks' do    
      @events = @client.events({:parent_resource => "leagues", :resource_id => "20f0857f-3c43-5f50-acfc-879f838ee853"}, "next")
      @events.should_not be_nil
    end
    
    it 'should return all events for last two weeks' do    
      @events = @client.events({:parent_resource => "leagues", :resource_id => "20f0857f-3c43-5f50-acfc-879f838ee853"}, "last")
      @events.should_not be_nil
    end
    
    it 'should return all events for season_type' do    
      @events = @client.events(:parent_resource => "leagues", :resource_id => "20f0857f-3c43-5f50-acfc-879f838ee853", :season_type => "postseason")
      @events.should_not be_nil
    end
  end
  
  context "requesting content" do
    use_vcr_cassette 'content'
    
    before do
      @client = Fanfeedr::Client.new(:api_key => "foobar", :tier => "basic")
    end
    
    it 'should return all content' do    
      @content = @client.content(:parent_resource => "leagues", :resource_id => "20f0857f-3c43-5f50-acfc-879f838ee853")
      @content.should_not be_nil
    end
  end
  
  context "requesting sources" do
    use_vcr_cassette 'sources'
    
    before do
      @client = Fanfeedr::Client.new(:api_key => "foobar", :tier => "basic")
    end
    
    it 'should return all sources' do    
      @sources = @client.sources(:parent_resource => "leagues", :resource_id => "20f0857f-3c43-5f50-acfc-879f838ee853")
      @sources.should_not be_nil
    end
  end
  
  context "requesting trending" do
    use_vcr_cassette 'trending'
    
    before do
      @client = Fanfeedr::Client.new(:api_key => "foobar", :tier => "basic")
    end
    
    it 'should return all trending for team' do    
      @trending = @client.trending({:parent_resource => "leagues", :resource_id => "20f0857f-3c43-5f50-acfc-879f838ee853"}, "teams")
      @trending.should_not be_nil
    end
    
    it 'should return all trending for persons' do    
      @trending = @client.trending({:parent_resource => "leagues", :resource_id => "20f0857f-3c43-5f50-acfc-879f838ee853"}, "persons")
      @trending.should_not be_nil
    end
  end
end