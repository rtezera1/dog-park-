require 'spec_helper'

feature 'user can see other dog owners', %q{
  User can see other registered dog owners. } do

   # I can see a list of other registered dog owners.

  it 'sees a title' do
    visit '/dogowners'
    expect(page).to have_content 'List of Dog Owners'
  end

  it 'see all the dog owners listed on the page' do

    dog_owner_1 = Dogowner.create(first_name: "Steve", last_name: "Smith",
                  email: "stevesmith@gmail.com")
    dog_owner_2 = Dogowner.create(first_name: "Mike", last_name: "Tyson",
                  email: "miketyson@gmail.com")
    visit '/dogowners'

    expect(page).to have_content dog_owner_1.fullname
    expect(page).to have_content dog_owner_2.fullname
  end
end



