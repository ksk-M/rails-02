class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations
  end

  def confirm
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in, :check_out, :number_of_people, :user_id, :room_id))
    @room = Room.find(params[:reservation][:room_id])
    if @reservation.invalid?
      render "rooms/show"
    end
  end
  
  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in, :check_out, :number_of_people, :user_id, :room_id))
    @room = Room.find(params[:reservation][:room_id])
    
    if params[:back]  # 修正ボタンで「name: :back」と定義している
      render "rooms/show"
      return
    end

    @reservation.save
    flash[:notice] = "予約の登録が完了しました"
    redirect_to :reservations
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "予約を削除しました"
    redirect_to :reservations
  end
end
