require 'vcr'

VCR.config do |c|
  c.cassette_library_dir     = 'spec/vcr_cassettes'
  c.stub_with                  :webmock
  c.ignore_localhost         = true
  c.default_cassette_options = { :record => :new_episodes }
end