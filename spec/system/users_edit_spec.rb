require 'rails_helper'

RSpec.describe "UsersEdits", type: :system do
    let(:user) { FactoryBot.create(:user) }

    scenario 'it fails edit with wrong information' do
        login_as(user)
        click_on "プロフィール編集"
        fill_in 'user[name]', with: ' '
        fill_in 'user_Animeter_id', with: " "
        fill_in 'user[mail]', with: 'user@invalid'
        fill_in 'user_password', with: 'foo'
        fill_in 'user_password_confirmation', with: 'bar'
        click_on '登録'
        aggregate_failures do
            expect(current_path).to eq user_path(user)
            expect(has_css?('.alert-danger')).to be_truthy
        end
    end

    scenario 'it succeeds edit with correct information' do
        login_as(user)
        click_on "プロフィール編集"

        fill_in 'user[name]', with: 'Foo Bar'
        fill_in 'user_Animeter_id', with: 'foo@bar.com'
        fill_in 'user[mail]', with: 'foo@bar.com'
        click_on '登録'
        aggregate_failures do
            expect(current_path).to eq user_path(user)
            expect(has_css?('.alert-success')).to be_truthy
        end
    end
end