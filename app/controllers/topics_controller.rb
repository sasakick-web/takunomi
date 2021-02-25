class TopicsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit,:show]
  before_action :find_topic, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @topic = Topic.new
  end

  def show
  # トピックの情報表示に利用
  @topic = Topic.find(params[:id])
  @messagess = Message.all
  # 投稿一覧表示に利用
  @messages = Message.where(topic_id: params[:id])
  # @messages = Message.includes(:user).order(created_at: :asc).where(topic_id: params[:id])
  # メッセージ投稿に利用
  @message = current_user.messages.build
  end

  def create
  @topic = Topic.new(topic_params)
  @topic.user_id = current_user.id
  @topic.save
  if @topic.save
    redirect_to @topic, notice: '作成できました'
  else
    render :new, alert: '作成できませんでした'
 end
  # redirect_to topics_index_path
end

def update
  if @topic.update(topic_params)
    redirect_to @topic, notice: '更新できました'
  else
    render :edit, alert: '更新できませんでした'
  end
end

def destroy
  if @topic.destroy
    redirect_to root_path, notice: '削除に成功しました'
  else
    redirect_to root_path, alert: '削除できませんでした'
end
end

  private
    def find_topic
      @topic = Topic.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:title, :body, :image)
    end

end
