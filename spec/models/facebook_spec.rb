require 'spec_helper'

describe Facebook do
  describe "associations" do
    it { should belong_to(:user) }
  end
end
