require 'rails_helper'

RSpec.describe Url, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:original_url) }
    it { FactoryBot.create(:url); should validate_uniqueness_of(:token) }
  end

  it "has a valid factory" do
    expect(FactoryBot.build(:url).save).to be_truthy
  end

  it "is invalid without a original_url" do
    expect(FactoryBot.build(:url, original_url: nil).save).to be_falsey
  end
end
