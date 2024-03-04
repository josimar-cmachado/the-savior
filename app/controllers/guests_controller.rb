class GuestsController < ApplicationController
  def new
    @guest = Guest.new
    @wedding = Wedding.find(params[:wedding_id])
  end

  def create
    @guest = Guest.new(guest_params)
    @wedding = Wedding.find(params[:wedding_id])
    @guest.wedding = @wedding
    if @guest.save
      redirect_to user_profile_path(current_user)
    else
      render :new
    end
  end

  def delete_all
    @wedding = Wedding.find(params[:wedding_id])
    @guests = Guest.where(wedding: @wedding)
    @guests.each do |guest|
      guest.destroy
    end
    redirect_to user_profile_path(current_user)
  end

  def edit
    @guest = Guest.find(params[:id])
    @wedding = Wedding.find(params[:wedding_id])
  end

  def update
  @wedding = Wedding.find(params[:wedding_id])
  @guest = @wedding.guests.find(params[:id])
    respond_to do |format|
      if @guest.update(guest_params)
        format.html { redirect_to user_profile_path(current_user), notice: 'Convidado editado com sucesso!' }
        format.json { render json: { status: :success, message: "Presença confirmada com sucesso!" } }
      else
        format.html { render :edit }
        format.json { render json: { status: :error, errors: @guest.errors.full_messages } }
      end
    end
  end


  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy
    redirect_to user_profile_path(current_user)
  end

  private

  def guest_params
    params.require(:guest).permit(:full_name, :email, :phone, :confirmed)
  end
end
