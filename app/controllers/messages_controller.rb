class MessagesController < ApplicationController

  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    # 保存できたらメッセージのページへ
    if @message.save
      redirect_to room_messages_path(@room)
    # 保存できなければ、indexアクションで同じページへ
    else
      render :index
    end
  end

  private

  # チャットルームに紐づいたメッセージのみを保存
  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

end