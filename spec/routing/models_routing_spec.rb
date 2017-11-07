require "rails_helper"

describe Testapi::ModelsController, type: :routing do
  routes { Testapi::Engine.routes }

  describe "routing" do
    it "#index" do
      expect(get "/models/User").to \
        route_to("testapi/models#index", model: "User")
    end

    it "#create" do
      expect(post "/models/User").to \
        route_to("testapi/models#create", model: "User")
    end

    it "#show" do
      expect(get "/models/User/3").to \
        route_to("testapi/models#show", model: "User", id: "3")
    end

    it "#update" do
      expect(patch "/models/User/3").to \
        route_to("testapi/models#update", model: "User", id: "3")
    end

    it "#destroy" do
      expect(delete "/models/User/3").to \
        route_to("testapi/models#destroy", model: "User", id: "3")
    end
  end
end
