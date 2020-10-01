require 'rails_helper'

RSpec.describe "AccessToUsersLogins", type: :request do
  describe "GET /access_to_users_logins" do
    it "works! (now write some real specs)" do
      get access_to_users_logins_path
      expect(response).to have_http_status(200)
    end
  end
end
