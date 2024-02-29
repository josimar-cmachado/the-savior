class GiftsController < ApplicationController
  def index
    @gifts = Gift.all
  end

  def new
    @gift = Gift.new
  end

  def create
    @gift = Gift.new(gift_params)
    @wedding = Wedding.find(params[:wedding_id])
    @gift.wedding = @wedding
    @gift.save

    redirect_to user_profile_path(current_user)
  end
  def edit
    @gift = Gift.find(params[:id])
  end

  def update
    @gift = Gift.find(params[:id])
    @gift.update(gift_params)
    redirect_to user_profile_path(current_user)
  end


  def destroy
    @gift = Gift.find(params[:id])
    @gift.destroy
    redirect_to user_profile_path(current_user)
  end

  private
    def gift_params
      params.require(:gift).permit(:title, :category, :value, :total_quota)
    end
end
