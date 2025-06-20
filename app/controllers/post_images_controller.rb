class PostImagesController < ApplicationController

  def new
    @post_image = PostImage.new
  end

   # 投稿データの保存
   def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id   #user_id としてcurrent_user.id の値を代入する、という意味になる
    if @post_image.save
    redirect_to post_images_path
    else
      render :new
    end
   end


  def index
    @post_images =  PostImage.page(params[:page])
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    post_image =  PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_images_path
  end
 

  # 投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end