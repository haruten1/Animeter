module TestHelper
    def is_logged_in?
        !session[:user_id].nil?
    end
end

module SystemHelper
    def login_as(user)
        visit login_path
        fill_in 'session[mail]', with: user.mail
        fill_in 'session[password]', with: user.password
        click_button "ログイン"
    end
end