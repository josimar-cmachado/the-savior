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

    # Orders info
    if @wedding_gifts != []
      @wedding_orders = @user_wedding.first.gifts.map(&:orders)
    end

    # Wedding info
    @name = "#{current_user.first_name} #{current_user.last_name}"
    @initials = "#{current_user.first_name[0]}#{current_user.last_name[0]}"
    @partner_name = @user_wedding.map { |partner| "#{partner.partner_first_name}" }
    @partner_initials = @user_wedding.map { |partner| "#{partner.partner_first_name[0]}#{partner.partner_last_name[0]}" }
    @couple = "#{current_user.first_name}&#{@partner_name.first}"
  end
end
