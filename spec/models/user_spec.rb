require "rails_helper"

describe User, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :email }

  it "should have a valid factory" do
    expect(build :user).to be_valid
  end
end
