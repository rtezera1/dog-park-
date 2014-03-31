require 'spec_helper'

feature 'User can register a dog', %q{
  As a dog owner
  I want to register my dog
  So that I can connect with other dog lovers } do

    # An owner must specify their first name, last name,
    #  email address, and dog's name.
    # Upon adding my entry,
    #  I can see a list of other registered dog owners.
    # An owner's full_name can be requested.

  context 'with valid attributes' do
    it 'registers a dog owner' do
      visit '/dogowners/new'

      fill_in 'First name', with: 'Mike'
      fill_in 'Last name', with: "Smith"
      fill_in "Email", with: "mikesmith@gmail.com"
      click_on 'Create Dogowner'

      expect(Dogowner.count).to eq(1)
      expect(page).to have_content "Dogowner created successfully"
    end
  end

  context 'with invalid attributes' do
    it 'sees errors for invalid attributes' do
      visit '/dogowners/new'

      fill_in 'Last name', with: "Smith"
      fill_in "Email", with: "mikesmith@gmail.com"
      click_on 'Create Dogowner'

      expect(page).to_not have_content "Dogowner created successfully"
    end

    it 'sees errors for invalid attributes' do
      visit '/dogowners/new'

      fill_in 'First name', with: 'Mike'
      fill_in "Email", with: "mikesmith@gmail.com"
      click_on 'Create Dogowner'

      expect(page).to_not have_content "Dogowner created successfully"
    end

    it 'sees errors for invalid attributes' do
      visit '/dogowners/new'

      fill_in 'First name', with: 'Mike'
      fill_in 'Last name', with: "Smith"
      click_on 'Create Dogowner'

      expect(page).to_not have_content "Dogowner created successfully"
    end

    it 'see errors within email invalid attributes' do
      visit '/dogowners/new'

      fill_in 'First name', with: "Chris"
      fill_in 'Last name', with: "Allen"
      fill_in 'Email', with: 'steve'
      click_on 'Create Dogowner'

      expect(page).to_not have_content "Dogowner created successfully"
    end
  end
end

