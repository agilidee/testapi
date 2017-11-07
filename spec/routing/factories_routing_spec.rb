require "rails_helper"

describe Testapi::FactoriesController, type: :routing do
  routes { Testapi::Engine.routes }

  describe "routing" do
    it "#index" do
      expect(post "/factories/user").to \
        route_to("testapi/factories#create", factory: "user")
    end
  end
end
