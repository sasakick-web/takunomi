class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit]
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :ensure_current_user, {only: [:edit, :update]}

  def index
    @posts = Post.order(created_at: :desc)
    @likes = Post.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(6)
    # @topic = @topic.page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @like = Like.new
    @user = User.find_by(id: @post.user_id)
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post, notice: '作成できました'
    else
      flash[:alert] = "作成できませんでした"
      redirect_to new_post_path
   end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: '更新できました'
    else
      flash[:alert] = "更新できませんでした"
      redirect_to edit_post_path
    end
  end

  def destroy
    if @post.destroy
      flash[:alert] = "削除できませんでした"
      redirect_to delete_post_path
    else
  end
end

def ensure_current_user
  if @post.user_id != current_user.id
    flash[:notice]="権限がありません"
    redirect_back(fallback_location: root_path)
  end
end

private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :matarial, :body, :comment, :image)
  end

end
