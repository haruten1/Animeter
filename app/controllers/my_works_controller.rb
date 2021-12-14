class MyWorksController < ApplicationController
    protect_from_forgery
    

    def gold
        exist_my_work=MyWork.find_by(user_id:session[:user_id],work_id: params[:id])
        if exist_my_work
            exist_my_work.update(rank:3)
            redirect_to"/works/form"
        else
            my_work=MyWork.create(user_id:session[:user_id],work_id: params[:id],rank: 3)
            redirect_to"/works/form"
        end
    end

    def silver
        exist_my_work=MyWork.find_by(user_id:session[:user_id],work_id: params[:id])
        if exist_my_work
            exist_my_work.update(rank:2)
            redirect_to"/works/form"
        else
            my_work=MyWork.create(user_id:session[:user_id],work_id: params[:id],rank: 2)
            redirect_to"/works/form"
        end
    end

    def bronze
        exist_my_work=MyWork.find_by(user_id:session[:user_id],work_id: params[:id])
        if exist_my_work
            exist_my_work.update(rank:1)
            redirect_to"/works/form"
        else
            my_work=MyWork.create(user_id:session[:user_id],work_id: params[:id],rank: 1)
            redirect_to"/works/form"
        end
    end

    def delete
        exist_my_work=MyWork.find_by(user_id:session[:user_id],work_id: params[:id])
        exist_my_work.delete
        redirect_to"/works/form"
    end
end
