require 'rails_helper'

RSpec.describe Cat, type: :model do
  subject { 
    described_class.new(name: "Garfield",
                        age: 10,
                        race: "fat")
  }

  context "#initialize" do
    it { expect(subject).to be_valid }

    it "name should be valid" do
      subject.name = nil
      expect(subject).to_not be_valid
    end 

    it "age should be valid" do
      subject.age = nil
      expect(subject).to_not be_valid
    end 

    it "race should be valid" do
      subject.race = nil
      expect(subject).to_not be_valid
    end 
  end

  context "#greeting" do
    it "returns 'Meow!'" do
      expect(Cat.greeting).to eq("Meow!")
    end
  end
end
