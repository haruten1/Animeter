class WorksController < ApplicationController
    def form
    end

    def search
        @works = Work.where('title LIKE ?', "%#{params[:search]}%") if params[:search].present?
        @title = params[:search]
    end

    def search_season
        @works= Work.where(year:params[:year],season:params[:season])
    end
end
