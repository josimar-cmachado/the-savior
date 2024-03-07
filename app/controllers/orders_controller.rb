class OrdersController < ApplicationController
  def new
    @order = Order.new
    @gift = Gift.find(params[:gift_id])
    @wedding = Wedding.find(params[:wedding_id])
  end

  def create
    @order = Order.new(order_params)
    @gift = Gift.find(params[:gift_id])
    @order.gift = @gift
    @user_wedding = Wedding.where(user: current_user).to_a
    @partner_first_name = @user_wedding.map { |partner| "#{partner.partner_first_name}" }.first
    @couple = "#{current_user.first_name}&#{@partner_first_name}"
    if @order.save
      flash[:notice] = "Obrigado(a) pela sua contribuição!"
      redirect_to wedding_info_path(@user_wedding, @couple)
    else
      flash[:alert] = "A compra não foi realizada! Tente novamente."
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:full_name, :message)
  end
end
