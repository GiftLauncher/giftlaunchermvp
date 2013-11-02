require 'spec_helper'

describe User do
  describe "validations" do
    it { should validate_uniqueness_of(:email) }
  end

  describe "when destroyed" do
    it "should destroy associated model as well" do
      user = create(:user, :facebook => create(:facebook))
      expect {
        user.destroy
      }.to change(Facebook, :count).by(-1)
    end
  end
end
