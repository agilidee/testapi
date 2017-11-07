require "rails_helper"

describe Testapi::DatabasesController, type: :routing do
  routes { Testapi::Engine.routes }

  describe "routing" do
    it "#destroy" do
      expect(delete "/database").to \
        route_to("testapi/databases#destroy")
    end
  end
end
