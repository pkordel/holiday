$LOAD_PATH.unshift(File.join(__dir__, '..', 'lib'))
$LOAD_PATH.unshift(__dir__)
require 'rspec'
require 'holiday'

require 'active_support/core_ext/date/conversions'
require 'active_support/core_ext/date/calculations'
require 'active_support/core_ext/date/acts_like'
require 'active_support/core_ext/numeric/time'

# This means we don't have to namespace our classes in our tests
include Holiday

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{__dir__}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|

end
