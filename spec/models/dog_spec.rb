require 'spec_helper'

describe Dog do

  let(:dog_owner) {Dogowner.create(first_name: 'Steve', last_name: 'Micheal',
                                    email: 'stevemike@gmail.com')}

  let(:dog) {Dog.create(owner: dog_owner, dog_name: 'sparky') }

  describe 'association' do
    it 'belongs to an owner' do
      # expect(dog).to respond_to(:dog_owner)
      dog.save
      expect(dog.owner).to eql(dog_owner)
    end
  end

  describe 'validation' do
    it 'is valid' do
       expect(dog).to be_valid
    end
    it 'has a dog name' do
       invalid_dog = Dog.new(dog_name: '')
       expect(invalid_dog.save).to be_false
    end
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
