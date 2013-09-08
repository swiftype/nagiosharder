require "spec_helper"

describe NagiosHarder::Site do
  describe "#service_status method" do
    let(:site) { NagiosHarder::Site.new("http://test.com/cgi-bin/nagios3", "test-user", "test-pass") }
    let(:fixture_response) { { :status => 200, :body => nagios_fixture('status_670_services.html'), :headers => {} } }

    it "should explicitly set the result limit to 0" do
      stub_request(:get, /test.com/).to_return(fixture_response)
      site.service_status
      WebMock.should have_requested(:get, /test.com/).with(:query => hash_including('limit' => '0'))
    end

    it "should return an array of statuses" do
      stub_request(:get, /test.com/).to_return(fixture_response)
      site.service_status.should be_kind_of(Array)
      site.service_status.should have(670).services
    end
  end
end
