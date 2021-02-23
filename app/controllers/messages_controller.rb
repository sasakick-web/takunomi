class MessagesController < ApplicationController


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

   # def update
   #   if @message.update(message_params)
   #     redirect_to @message, notice: '更新できました'
   #   else
   #     render :edit, alert: '更新できませんでした'
   #   end
   # end

   private

   def message_params
     params.require(:message).permit(:content)
   end
end
