require "spec_helper"

describe NagiosHarder::Site do
  describe "#service_status method" do
    let(:site) { NagiosHarder::Site.new("http://test.com/cgi-bin/nagios3", "test-user", "test-pass") }

    before do
      stub_request(:get, "http://test-user:test-pass@test.com/cgi-bin/nagios3/status.cgi?embedded=1&noheader=1&servicegroup=all&style=detail").
        to_return(:status => 200, :body => nagios_fixture('status_670_services.html'), :headers => {})
    end

    it "should return an array of statuses" do
      site.service_status.should be_kind_of(Array)
      site.service_status.should have(670).services
    end
  end
end
