class MyWorksController < ApplicationController
    protect_from_forgery
    

    def create

        my_work=MyWork.new(user_id:session[:user_id],work_id: params[:id],rank: 3)
        if my_work.save
            redirect_to "/"
        else
            redirect_to"/works/form"
        end
    end
end
