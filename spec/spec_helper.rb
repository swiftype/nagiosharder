# Enable HTTParty testing
require 'webmock/rspec'

# Load the library
require File.join(File.dirname(__FILE__), '..', 'lib', 'nagiosharder')

# Helper method to load html fixtures
def nagios_fixture(name)
  fixtures_dir = File.join(File.dirname(__FILE__), 'fixtures')
  File.read(File.join(fixtures_dir, name)).encode('ASCII-8BIT')
end
