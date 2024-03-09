class GiftsController < ApplicationController
  def index
    @wedding = Wedding.find(params[:wedding_id])
    @gifts = @wedding.gifts
    @partner_first_name = @wedding.partner_first_name
    @couple = "#{current_user.first_name}&#{@partner_first_name}"
  end

  def new
    @gift = Gift.new
    @wedding = Wedding.find(params[:wedding_id])
  end

  def delete_all
    @wedding = Wedding.find(params[:wedding_id])
    @gifts = Gift.where(wedding: @wedding)
    @gifts.each do |gift|
      gift.destroy
    end
    redirect_to user_profile_path(current_user)
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
    @wedding = Wedding.find(params[:wedding_id])
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
      params.require(:gift).permit(:title, :category, :value, :total_quota, :photo)
    end
end
