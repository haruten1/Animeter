class WorksController < ApplicationController
    def form
    end

    def search
        search = params[:search]
            if search==""
                redirect_to "/works/form"
            end
        @works = Work.where('title LIKE ?', "%#{params[:search]}%") if params[:search].present?
        @title = params[:search]
    end

    def search_season
        @works= Work.where(year:params[:year],season:params[:season])
    end
end
