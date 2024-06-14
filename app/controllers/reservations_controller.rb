class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in, :check_out, :number_of_people, :user_id, :room_id))

    if @reservation.save
      flash[:notice] = "予約の登録が完了しました"
      redirect_to :reservations
    else
      @room = Room.find_by(params[:reservation][:room_id])
      flash[:alert] = "予約の登録に失敗しました"
      render "rooms/show"
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])

    @reservation.destroy
    flash[:notice] = "予約を削除しました"
    redirect_to :reservations
  end
end
