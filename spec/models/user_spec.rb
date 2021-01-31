require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: "Julien") }

  context "#initialize" do
    it { expect(subject).to be_valid }

    it "name should be valid" do
      subject.name = nil
      expect(subject).to_not be_valid
    end 
  end

  describe 'associations' do
    it { should have_many(:cats) }
  end

  describe 'validations' do
    context 'it validates name' do
      it { is_expected.to validate_presence_of(:name) }
    end
  end
end