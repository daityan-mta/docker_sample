class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    # @user = current_user 
  end
  
  def new
  end

  def create
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザーを更新しました"
      redirect_to :edit_user_get
    else
      flash[:notice] = "ユーザーを更新できませんでした"
      render :edit
    end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end
