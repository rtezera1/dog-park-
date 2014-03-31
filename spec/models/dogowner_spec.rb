require 'spec_helper'

describe Dogowner do

  let(:dog_owner_1)  {{first_name: "Steve", last_name: "Smith",
                        email: "stevesmith@gmail.com" }}

  describe 'validations' do

    it 'requires a first name' do
      invalid_first_name = Dogowner.new(dog_owner_1.merge(first_name: ''))
      expect(invalid_first_name.save).to be_false
    end

    it 'requires a last name' do
      invalid_last_name = Dogowner.new(dog_owner_1.merge(last_name: ''))
      expect(invalid_last_name.save).to be_false
    end

    it 'requires an email' do
      invalid_email = Dogowner.new(dog_owner_1.merge(email: ''))
      expect(invalid_email.save).to be_false
    end

    it 'email must be valid' do
      invalid_email = Dogowner.new(dog_owner_1.merge(email: 'stevesmith'))
      expect(invalid_email.save).to be_false
    end

  end

  describe 'association' do
    it 'should have dogs' do
      dog_owner_2 = Dogowner.create(first_name: "Steve", last_name: "Smith",
                        email: "stevesmith@gmail.com")
      dog_owner_2.save
       dog = Dog.create(owner: dog_owner_2, dog_name: 'sparky')

       dog_owner_2.dogs = [dog]
       expect(dog_owner_2.dogs).to include(dog)
    end
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
