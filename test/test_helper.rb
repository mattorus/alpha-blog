ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def sign_in_as(user, password)
    post login_path, params: {session: {email: user.email, password: password}}
  end

  def setup_admin_user
    @admin_user = User.create(username: "john", email: "john@example.com", password: "password", admin: true)
  end
  
  def sign_in_admin_user
    sign_in_as(@admin_user, "password")
  end

end
