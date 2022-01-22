class MyWorksController < ApplicationController
    protect_from_forgery
    before_action:work

    def gold
        #workが既に登録されているか判別
        exist_my_work=MyWork.find_by(user_id:session[:user_id],work_id: params[:id])
        if exist_my_work
            exist_my_work.update(rank:3)
        else
            my_work=MyWork.create(user_id:session[:user_id],work_id: params[:id],rank: 3)
        end
    end

    def silver
        exist_my_work=MyWork.find_by(user_id:session[:user_id],work_id: params[:id])
        if exist_my_work
            exist_my_work.update(rank:2)
        else
            my_work=MyWork.create(user_id:session[:user_id],work_id: params[:id],rank: 2)
        end
    end

    def bronze
        exist_my_work=MyWork.find_by(user_id:session[:user_id],work_id: params[:id])
        if exist_my_work
            exist_my_work.update(rank:1)
        else
            my_work=MyWork.create(user_id:session[:user_id],work_id: params[:id],rank: 1)
        end
    end

    def delete
        exist_my_work=MyWork.find_by(user_id:session[:user_id],work_id: params[:id])
        exist_my_work.delete
        @my_work = MyWork.find_by(user_id:session[:user_id],work_id:params[:id])
    end

    def my_page_gold
        exist_my_work=MyWork.find_by(user_id:session[:user_id],work_id: params[:id])
        if exist_my_work
            exist_my_work.update(rank:3)
        else
            my_work=MyWork.create(user_id:session[:user_id],work_id: params[:id],rank: 3)
        end
        #更新後のランクを表示させるため、再度my_worksを取得
        @my_work = MyWork.find_by(user_id:session[:user_id],work_id:params[:id])
    end

    def my_page_silver
        exist_my_work=MyWork.find_by(user_id:session[:user_id],work_id: params[:id])
        if exist_my_work
            exist_my_work.update(rank:2)
        else
            my_work=MyWork.create(user_id:session[:user_id],work_id: params[:id],rank: 2)
        end
        @my_work = MyWork.find_by(user_id:session[:user_id],work_id:params[:id])
    end

    def my_page_bronze
        exist_my_work=MyWork.find_by(user_id:session[:user_id],work_id: params[:id])
        if exist_my_work
            exist_my_work.update(rank:1)
        else
            my_work=MyWork.create(user_id:session[:user_id],work_id: params[:id],rank: 1)
        end
        @my_work = MyWork.find_by(user_id:session[:user_id],work_id:params[:id])
    end

    def my_page_delete
        exist_my_work=MyWork.find_by(user_id:session[:user_id],work_id: params[:id])
        exist_my_work.delete
        @my_work = MyWork.find_by(user_id:session[:user_id],work_id:params[:id])
    end

    private

    def work
        @work =Work.find_by(id:params[:id])
    end
end
