require 'spec_helper'

feature 'User can register a dog', %q{
  As a dog owner
  I want to register my dog
  So that I can connect with other dog lovers
} do


    # An owner must specify their first name, last name,
    #  email address, and dog's name.
    # Upon adding my entry,
    #  I can see a list of other registered dog owners.
    # An owner's full_name can be requested.

    context 'with valid attributes' do
      it 'registers a dog' do
        visit '/dogs/new'

        select 'Owner', from: 'Owner_id'
        fill_in 'Dog name', with: "poopy"
        click_on 'Create Dog'

        expect(Dog.count).to eq(1)
      end
    end

    context 'with invalid attributes' do
      it 'sees errors for invalid attributes' do
        visit '/dogs/new'

        select 'Owner', from: 'Owner_id'
        click_on 'Create Dog'

        expect(page).to_not have_content "Dog registered successfully"
      end
    end
end
