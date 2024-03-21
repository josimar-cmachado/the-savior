class OrdersController < ApplicationController
  before_action :set_wedding, only: [:new, :create]
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
    @order = Order.new
    @gift = Gift.find(params[:gift_id])
  end

  def create
    @order = Order.new(order_params)
    @gift = Gift.find(params[:gift_id])
    @order.gift = @gift
    @user_wedding = Wedding.where(user: @wedding.user_id).to_a
    @couple = "#{@wedding.user.first_name}&#{@user_wedding.first.partner_first_name}"
    if @order.save
      flash[:notice] = "Obrigado(a) pela sua contribuição!"
      redirect_to wedding_info_path(@user_wedding, @couple)
    else
      flash[:alert] = "A compra não foi realizada! Tente novamente."
      render :new
    end
  end

  private

  def set_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end

  def order_params
    params.require(:order).permit(:full_name, :message)
  end
end
