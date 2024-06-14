class RoomsController < ApplicationController
  def index
    @rooms = current_user.rooms
    # 下記でも実装できるが、モデル同士の関連付けによって簡易的に書ける
    # @rooms = Room.where(user_id: current_user.id)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :introduction, :charge, :address, :image, :user_id))

    if @room.save
      flash[:notice] = "施設を登録しました"
      redirect_to :rooms
    else
      flash.now[:alert] = "施設の登録に失敗しました"
      render "rooms/new"      
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])

    if @room.update(params.require(:room).permit(:name, :introduction, :charge, :address, :image, :user_id))
      flash[:notice] = "施設を更新しました"
      redirect_to :rooms
    else
      flash.now[:alert] = "施設の更新に失敗しました"
      render "rooms/edit"      
    end
  end

  def destroy
    @room = Room.find(params[:id])

    @room.destroy
    flash[:notice] = "施設を削除しました"
    redirect_to :rooms
  end
end
