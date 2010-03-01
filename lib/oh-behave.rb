require 'garb'

module OhBehave
    
  class TestSuite
    cattr_accessor :email, :password, :profile
    
    def self.login
      @@auth_token ||= begin
        if self.email && self.password
          Garb::Session.login(self.email, self.password)
        else
          raise "Please set your Google Analytics email and password in your test suite."
        end
      end
    end
    
    def self.site
      @@site ||= begin
        login
        if self.profile
          Garb::Profile.first(profile)
        else
          raise "Please set the profile of the Google Analytics site you'd like to test."
        end
      end
    end
    
  end
end