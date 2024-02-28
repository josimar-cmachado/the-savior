class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_wedding = Wedding.where(user: current_user).to_a
    @wedding = Wedding.new
    @gifts = Gift.where(user: current_user)
    @gift = Gift.new
    @name = "#{current_user.first_name} #{current_user.last_name}"
    @initials = "#{current_user.first_name[0]}#{current_user.last_name[0]}"
    @partner_name = @user_wedding.map { |partner| "#{partner.partner_full_name}" }
    @couple = "#{current_user.first_name}&#{@partner_name.first}"
  end
end
