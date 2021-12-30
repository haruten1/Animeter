require 'rails_helper'

RSpec.describe "Sessions", type: :request do
    let(:user) {FactoryBot.create(:user)}

    describe "delete /logout" do
        before do
            post login_path, params: { session: {
                mail: user.mail,
                password: user.password,
            } }
        end

        it 'redirects to "/"' do
            delete logout_path
            aggregate_failures do
                expect(response).to redirect_to "/"
                expect(is_logged_in?).to be_falsy
            end
        end
    end
end