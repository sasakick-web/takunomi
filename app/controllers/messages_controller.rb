class MessagesController < ApplicationController
  before_action :find_message, only: [:show, :edit, :update, :destroy]


  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.topic_id = params[:topic_id]
    # @message.topic_id = Topic.topic_id
    @message.user_id = current_user.id
    @message.save
 end

   def destroy
     if @message.destroy
       redirect_to topics_show_path(id: @message.topic_id), notice: '削除に成功しました'
     else
       redirect_to topics_show_path(id: @message.topic_id), alert: '削除できませんでした'
   end
   end

   private

   def find_message
     @message = Message.find(params[:id])
   end

   def message_params
     params.require(:message).permit(:content)
   end
end
