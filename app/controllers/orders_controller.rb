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
    @couple = "#{@wedding.user.first_name}&#{@wedding.partner_first_name}"
    if @order.save
      flash[:notice] = "Obrigado(a) pela sua contribuição!"
      redirect_to root_path
    else
      flash[:alert] = "A compra não foi realizada! Tente novamente."
      render :new
    end
  end

  private

  def set_wedding
    @my = Wedding.last
    @wedding = Wedding.find(@my.id)
  end

  def order_params
    params.require(:order).permit(:full_name, :message)
  end
end
