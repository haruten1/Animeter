class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @my_works = MyWork.where(user_id:params[:id])
    @my_works_log = @my_works.order(updated_at: :desc)
    @my_works_log = @my_works_log.first(10)

    @my_works = @my_works.order(rank: :desc)
    
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "ようこそAnimeterへ!!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "プロフィールを更新しました"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def form
  end

  def search
    search = params[:search]
      if search==""
        redirect_to "/users/form"
      end
    @users = User.where('Animeter_id LIKE ?', "%#{params[:search]}%") if params[:search].present?
    @user_name =params[:search]
  end

  private

    def user_params
      params.require(:user).permit(:name, :mail, :password,:Animeter_id,
                                  :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end
end
