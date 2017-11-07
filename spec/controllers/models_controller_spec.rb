require "rails_helper"

describe Testapi::ModelsController, type: :controller do
  routes { Testapi::Engine.routes }

  render_views

  describe "#index" do
    it "should return objects" do
      create(:user, name: "Benoit")
      create(:user, name: "Marc")

      get :index, params: {model: "User"}

      expect(response).to be_ok
      expect(json_response.length).to eq 2
      expect(json_response[0]["name"]).to eq "Benoit"
      expect(json_response[1]["name"]).to eq "Marc"
    end

    it "should return error if model is invalid" do
      get :index, params: {model: "Hey"}
      expect(response.status).to eq 422
      expect(json_response).to eq("error" => "uninitialized constant Hey")
    end
  end # describe "#index"

  describe "#create" do
    it "should create object" do
      expect {
        post :create, params: {
          :model      => "User",
          :attributes => {
            :name  => "Benoit",
            :email => "benoit@example.org",
          },
        }
      }.to change(User, :count).by(1)

      expect(response).to be_ok
      expect(json_response["name"]).to eq "Benoit"
      expect(json_response["email"]).to eq "benoit@example.org"
    end

    it "should return object errors" do
      post :create, params: {model: "User", attributes: {email: "benoit@example.org"}}

      expect(response.status).to eq 422
      expect(json_response).to eq("error" => "Validation failed: Name can't be blank")
    end
  end # describe "#create"

  describe "#show" do
    it "should return object" do
      user = create(:user, email: "benoit@example.org")

      get :show, params: {model: "User", id: user}

      expect(response).to be_ok
      expect(json_response["email"]).to eq "benoit@example.org"
    end

    it "should return error" do
      get :show, params: {model: "User", id: "invalid"}

      expect(response.status).to eq 422
      expect(json_response).to eq("error" => "Couldn't find User with 'id'=invalid")
    end
  end # describe "#show"

  describe "#update" do
    it "should update and return object" do
      user = create(:user, email: "benoit@example.org")

      patch :update, params: {model: "User", id: user, attributes: {email: "new@example.org"}}

      expect(response).to be_ok
      expect(user.reload.email).to eq "new@example.org"
      expect(json_response["email"]).to eq "new@example.org"
    end

    it "should not save and return error" do
      user = create(:user, name: "Benoit")

      patch :update, params: {model: "User", id: user, attributes: {name: ""}}

      expect(response.status).to eq 422
      expect(user.reload.name).to eq "Benoit"
      expect(json_response).to eq("error" => "Validation failed: Name can't be blank")
    end
  end # describe "#update"

  describe "#destroy" do
    it "should destroy and return object" do
      user = create(:user, email: "benoit@example.org")

      expect {
        delete :destroy, params: {model: "User", id: user}
      }.to change(User, :count).by(-1)

      expect(response).to be_ok
      expect(json_response["email"]).to eq "benoit@example.org"
    end

    it "should return error" do
      delete :destroy, params: {model: "User", id: "invalid"}

      expect(response.status).to eq 422
      expect(json_response).to eq("error" => "Couldn't find User with 'id'=invalid")
    end
  end # describe "#destroy"
end
