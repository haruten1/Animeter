RSpec.describe "UsersLogins", type: :system do
    let(:user) { FactoryBot.create(:user) }

    scenario 'Don\'t login when user submits invalid information' do
        visit login_path
        fill_in 'session[mail]', with: ' '
        fill_in 'session[password]', with: ' '
        click_button "ログイン"
        aggregate_failures do
            expect(current_path).to eq login_path
            expect(has_css?('.alert-danger')).to be_truthy
            visit current_path
            expect(has_css?('.alert-danger')).to be_falsy
        end
    end

    scenario 'login succeeds when user submits valid information' do
        visit login_path
        fill_in 'session[mail]',    with: user.mail
        fill_in 'session[password]', with: user.password
        click_button "ログイン"
        aggregate_failures do
            expect(current_path).to eq user_path(user)
        end
        find('.menu').click
        click_link "ログアウト"
        aggregate_failures do
            expect(current_path).to eq "/"
            expect(page).to have_link "ログイン", href: login_path
            expect(page).to have_no_link "ログアウト"
        end
    end
end
