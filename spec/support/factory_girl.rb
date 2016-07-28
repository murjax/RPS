# RSpec
# spec/support/factory_girl.rb
require 'factory_girl'
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end