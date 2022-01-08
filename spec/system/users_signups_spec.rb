require 'rails_helper'
RSpec.describe "UsersSignups", type: :system do
    scenario 'Don\'t create new data when user submits invalid information' do
        visit signup_path
        fill_in 'user_name', with: ' '
        fill_in 'user_Animeter_id', with: 'sample'
        fill_in 'mail', with: 'user@invalid'
        fill_in 'user_password', with: 'foo'
        fill_in 'user_password_confirmation', with: 'bar'
        attach_file 'user_img', "#{Rails.root}/spec/factories/img/test.jpeg"
        click_on '登録'
        aggregate_failures do
            expect(current_path).to eq users_path
        end
    end

    scenario 'Create new data when user submits valid information' do
        visit signup_path
        fill_in 'user_name', with: 'Example User'
        fill_in 'user_Animeter_id', with: 'sample'
        fill_in 'mail', with: 'user@example.com'
        fill_in 'user_password', with: 'password'
        fill_in 'user_password_confirmation', with: 'password'
        attach_file 'user_img', "#{Rails.root}/spec/factories/img/test.jpeg"
        click_on '登録'
        aggregate_failures do
            expect(current_path).to eq user_path(User.last)
            expect(has_css?('.alert-success')).to be_truthy
            visit current_path 
            expect(has_css?('.alert-success')).to be_falsy
        end
    end
end