require 'rails_helper'

RSpec.describe "Users", type: :request do
    describe "POST /users" do
        let(:user) { FactoryBot.attributes_for(:user) } 
        it "adds new user with correct signup information" do
            aggregate_failures do
                expect do
                    post users_path, params: { user: user } 
                    end.to change(User, :count).by(1)
                    expect(response).to have_http_status(302)
                    expect(response).to redirect_to user_path(User.last)
                    expect(is_logged_in?).to be_truthy 
            end
        end
    end

    describe "before_action: :logged_in_user" do
        let(:user) { FactoryBot.create(:user) }
    
        it 'redirects edit when not logged in' do
            get edit_user_path(user)
            expect(response).to redirect_to login_path
        end
    
        it 'redirects update when not logged in' do
            patch user_path(user), params: { user: {
                name: user.name,
                email: user.mail,
            } }
            expect(response).to redirect_to login_path
        end
    end

    # describe "before_action: :correct_user" do
    #     let(:user) { FactoryBot.create(:user) }
    #     let(:other_user) { FactoryBot.create(:user) }
    
    #     before { login_as(other_user) }
    #     it 'redirects edit when logged in as wrong user' do
    #         get edit_user_path(user)
    #         expect(is_logged_in?).to be_truthy
    #         expect(response).to redirect_to "/"

            
    #     end
    
    #     it 'redirects update when logged in as wrong user' do
    #         patch user_path(user), params: { user: {
    #             name: user.name,
    #             mail: user.mail,
    #         } }
    #         expect(response).to redirect_to "/"
    #     end
    # end

    
end