class UsersController < ApplicationController
  def show
    # User info
    @user_wedding = Wedding.where(user: current_user).to_a
    @wedding = Wedding.new

    # Gift info
    @wedding_gifts = Gift.where(wedding: @user_wedding)
    @gift = Gift.new

    # Guest info
    @wedding_guests = Guest.where(wedding: @user_wedding)
    @guest = Guest.new
    @confirmed_guests = @wedding_guests.where(confirmed: true)
    @unconfirmed_guests = @wedding_guests.where(confirmed: nil)
    @not_attending_guests = @wedding_guests.where(confirmed: false)
    @percentage_minus_not_attending = (@confirmed_guests.count * 100) / @wedding_guests.count if @wedding_guests.count != 0 && @confirmed_guests.count != 0
    @percentage = @percentage_minus_not_attending || 0

    # Orders info
    if @wedding_gifts != []
      @wedding_orders = @user_wedding.first.gifts.map(&:orders)
      @orders = Order.where(gift: @wedding_gifts)
    else
      @wedding_orders = []
      @orders = []
    end
    if @orders != nil
      @total_orders_value = @orders.map { |order| Gift.find(order.gift_id).value }.sum
    end

    # Tips info
    @tips = Tip.where(wedding: @user_wedding)

    # Wedding info
    @name = "#{current_user.first_name} #{current_user.last_name}"
    @initials = "#{current_user.first_name[0]}#{current_user.last_name[0]}"
    @partner_first_name = @user_wedding.map { |partner| "#{partner.partner_first_name}" }.first
    @partner_last_name = @user_wedding.map { |partner| "#{partner.partner_last_name}" }.first
    @partner_email = @user_wedding.map { |partner| "#{partner.partner_email}" }.first
    @partner_phone = @user_wedding.map { |partner| "#{partner.partner_phone}" }.first
    @partner_initials = @user_wedding.map { |partner| "#{partner.partner_first_name[0]}#{partner.partner_last_name[0]}" }
    @couple = "#{current_user.first_name}&#{@partner_first_name}"
  end
end
