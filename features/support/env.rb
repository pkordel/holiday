require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')
require 'holiday'
require 'chronic'
require 'active_support/core_ext/date/conversions'
require 'active_support/core_ext/date/calculations'
require 'active_support/core_ext/date/acts_like'
require 'active_support/core_ext/numeric/time'

require 'rspec/expectations'

# This means we don't have to namespace our classes in our tests
include Holiday

