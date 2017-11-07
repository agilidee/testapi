require "rails_helper"

describe Testapi::FactoriesController, type: :controller do
  routes { Testapi::Engine.routes }

  render_views

  describe "#create" do
    it "should call factory and return object" do
      expect(FactoryBot).to receive(:create).with(:user, {}).and_call_original

      expect {
        post :create, params: {factory: "user"}
      }.to change(User, :count).by(1)

      expect(response).to be_ok

      user = User.last_created
      expect(user.email).to be_present
      expect(user.name).to be_present

      expect(json_response["name"]).to eq user.name
      expect(json_response["email"]).to eq user.email
    end

    it "should accept attributes" do
      expect {
        post :create, params: {factory: "user", attributes: {name: "Benoit"}}
      }.to change(User, :count).by(1)

      user = User.last_created
      expect(user.name).to eq "Benoit"
    end

    it "should return error on invalid factory" do
      post :create, params: {factory: "abc"}
      expect(response.status).to eq 422
      expect(json_response).to eq("error" => "Factory not registered: abc")
    end
  end # describe "#create"
end
