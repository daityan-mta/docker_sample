class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_param)
    if @inquiry.save
      flash[:notice] = '投稿が完了しました'
      redirect_to top_path, notice: '投稿が完了しました'
    else
      flash[:notice] = '投稿に失敗しました'
      render :new
    end
  end

  private

  def inquiry_param
    params.require(:inquiry).permit(:genre, :name, :email, :inquiery, :image)
  end
end
