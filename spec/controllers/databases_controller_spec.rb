require "rails_helper"

describe Testapi::DatabasesController, type: :controller do
  routes { Testapi::Engine.routes }

  render_views

  describe "#destroy" do
    it "should clear database" do
      expect(DatabaseCleaner).to receive(:clean_with)
      delete :destroy
      expect(response).to be_ok
      expect(json_response).to be_empty
    end
  end # describe "#destroy"
end
