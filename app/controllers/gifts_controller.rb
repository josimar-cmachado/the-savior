class GiftsController < ApplicationController
  def new
    @gift = Gift.new
  end

  def create
    @gift = Gift.new(gift_params)
    @gift.save
    redirect_to @gift
  end
  def edit
    @gift = Gift.find(params[:id])
  end

  def update
    @gift = Gift.find(params[:id])
    @gift.update(gift_params)
    redirect_to @gift
  end

  def update
    @gift = Gift.find(params[:id])
    @gift.update(gift_params)
    redirect_to @gift
  end

  def delete
    @gift = Gift.find(params[:id])
    @gift.destroy
    redirect_to gifts_path
  end

  private
    def gift_params
      params.require(:gift).permit(:title, :category, :value, :total_quota, :wedding_id)
    end
end
