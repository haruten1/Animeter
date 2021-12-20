class AnimeterController < ApplicationController
    def animeter
        your_works =MyWork.where(user_id:params[:id])
        your_works_array = Array.new

        your_works.each do |work|
            your_works_array.push(work.work_id)
        end

        my_works=MyWork.where(user_id:session[:user_id])
        my_works_array = Array.new

        my_works.each do |work|
            my_works_array.push(work.work_id)
        end


        common_works_arry=your_works_array & my_works_array

        @common_works=Array.new

        common_works_arry.each do |work_id|
            common_work=Work.where(id: work_id)
            @common_works.push(common_work)
        end
    end
end
