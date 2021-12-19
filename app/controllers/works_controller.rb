class WorksController < ApplicationController
    def form
    end

    def search
        @works = Work.where('title LIKE ?', "%#{params[:search]}%") if params[:search].present?
        @user_name = params[:search]
    end
end
