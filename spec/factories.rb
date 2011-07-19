require 'factory_girl'

Factory.define :user do |u|
  u.email = 'user1@test.com'
  u.password = 'password'
end
