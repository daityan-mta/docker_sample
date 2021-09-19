class UsersController < ApplicationController

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
    if @user.update!(params.require(:user).permit(:name, :introduction, :image))
      flash[:notice] = "ユーザーを更新しました"
      redirect_to :edit_user_get
    else
      flash[:notice] = "ユーザーを更新できませんでした"
      render :edit
    end
  end

  def destroy
  end

end
