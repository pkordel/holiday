$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'holiday'

require 'active_support/core_ext/date/conversions'
require 'active_support/core_ext/date/calculations'
require 'active_support/core_ext/date/acts_like'
require 'active_support/core_ext/numeric/time'


# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|

end
