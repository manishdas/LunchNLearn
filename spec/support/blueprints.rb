require 'machinist/active_record'
require 'ffaker'

User.blueprint do
  username { Faker::Name.name }
  email { Faker::Internet.email }
  password { "secret" }
end
