class AnimeterController < ApplicationController
    before_action :logged_in_user

    def animeter
        #相手のユーザー情報を取得
        @your_user = User.find(params[:id])

        #相手のmy_animeを取得
        your_works =MyWork.where(user_id:params[:id])
        #新規配列を宣言
        your_works_array = Array.new

        #作成した配列にmy_worksのwork_idだけを代入
        your_works.each do |work|
            your_works_array.push(work.work_id)
        end

        #自分ののmy_animeを取得
        my_works=MyWork.where(user_id:session[:user_id])
        #新規配列を宣言
        my_works_array = Array.new

        #作成した配列にmy_worksのwork_idだけを追加していく
        my_works.each do |work|
            my_works_array.push(work.work_id)
        end

        #2つの配列から共通するwork_idを抽出
        common_works_arry=your_works_array & my_works_array

        #viewに渡すための配列を宣言
        @common_works=Array.new

        #新規配列に共通して登録しているアニメの情報を追加していく
        common_works_arry.each do |work_id|
            common_work=Work.where(id: work_id)
            @common_works.push(common_work)
        end
    end

    private
    def logged_in_user
        unless logged_in?
            flash[:danger] = "ログインしてください"
            redirect_to login_url
        end
    end
end
