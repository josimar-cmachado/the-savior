class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @gift = Gift.find(params[:gift_id])
    @order.gift = @gift
    @order.save
    redirect_to @order
  end
end
