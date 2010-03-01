require 'helper'

class TestOhBehave < Test::Unit::TestCase
  
  include OhBehave
  
  context "A TestSuite without email and password set" do
    setup do
      TestSuite.email = nil
      TestSuite.password = nil
    end
    should "fail when attempting to log in" do
      assert_raise RuntimeError do
        TestSuite.login
      end
    end
  end

  context "A TestSuite with email and password set" do
    setup do
      TestSuite.email = 'test@test.net'
      TestSuite.password = 'password'
    end
    should "be able to log in" do
      # Auth error, since this is a bogus account
      assert_raise Garb::AuthenticationRequest::AuthError do
       TestSuite.login
      end
    end
  end
  
end