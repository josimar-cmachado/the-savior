class GuestsController < ApplicationController
  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(guest_params)
    @guest.save
    redirect_to @guest
  end

  def edit
    @guest = Guest.find(params[:id])
  end

  private
    def guest_params
      params.require(:guest).permit(:full_name, :email, :phone, :confirmed, :wedding_id)
    end
end
