class UsersController < ApplicationController
  def index
    @user = current_user
  end
  
  def new
  end

  def create
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if current_user.update!(params.require(:user).permit(:name,:introduction,:image))
      flash[:notice] = "ユーザーを更新しました"
      redirect_to :users
    else
      render "index"
    end
  end

  def destroy
  end

  def account
  end

  def profile
    @users = User.new
  end

end
