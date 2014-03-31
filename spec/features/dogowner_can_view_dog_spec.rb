require 'spec_helper'

feature 'dog owner can see other dog owners', %q{
  User can see other registered dog owners. } do

   # I can see a list of other registered dog owners.

  it 'see all the dog owners and dogs listed on the page' do

    dog_1 = Dog.create(owner: "Steve", dog_name: "popy")
    dog_2 = Dog.create(owner: "Mike", dog_name: "dooduy")

    visit '/dogs'

    expect(page).to have_content dog_owner_1.owner
    expect(page).to have_content dog_owner_2.owner
  end
end
