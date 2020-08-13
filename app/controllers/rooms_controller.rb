class RoomsController < ApplicationController
  def new
    @room = Room.new # 新しいチャットルームができた
  end
end
