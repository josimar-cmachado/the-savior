class WeddingsController < ApplicationController
  before_action :set_wedding, only: %i[edit update destroy]
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @wedding = Wedding.find(params[:wedding_id])
    @gifts = @wedding.gifts
    @guests = Guest.where(wedding: @wedding)
    @user_wedding = Wedding.where(user: @wedding.user_id).to_a
    @user_wedding_tips = Tip.where(wedding: @user_wedding)
    @wedding_guests_messages = Guest.where(wedding: @wedding).select { |guest| guest.confirmation_message.present? }
    @partner_name = @user_wedding.map { |partner| "#{ partner.partner_first_name }" }.first
    @days_left = (@wedding.date - Date.today).to_i
    @month = @wedding.date.strftime("%B")
    @month =
    case @month
      when "January" then "Janeiro"
      when "February" then "Fevereiro"
      when "March" then "Março"
      when "April" then "Abril"
      when "May" then "Maio"
      when "June" then "Junho"
      when "July" then "Julho"
      when "August" then "Agosto"
      when "September" then "Setembro"
      when "October" then "Outubro"
      when "November" then "Novembro"
      when "December" then "Dezembro"
    end
    @day = @wedding.date.strftime("%d")
    @year = @wedding.date.strftime("%Y")
    @date = "#{@day} de #{@month}, #{@year} | #{@wedding.time.strftime("%H:%M")}h"
    @markers = [{
                lat: @wedding.latitude,
                lng: @wedding.longitude,
                info_window_html: render_to_string(
                                                  partial: "info_window",
                                                  locals: { wedding: @wedding }),
                marker_html: render_to_string(partial: "marker")
                                                  }] if @wedding.latitude && @wedding.longitude

    if @wedding
      render :show
    else
      redirect_to root_path
    end
  end

  def new
    @wedding = Wedding.new
  end

  def create
    @wedding = Wedding.new(wedding_params)
    @wedding.user = current_user
    if @wedding.save
      redirect_to new_wedding_tip_path(@wedding)
    else
      render :new, status: :unprocessable_entity, flash: { error: "Please fill in all the fields" }
    end
  end

  def edit
  end

  def update
    if @wedding.update(wedding_params)
      redirect_to new_wedding_tip_path(@wedding)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @wedding.destroy
    redirect_to user_profile_path(current_user)
  end

  private

  def set_wedding
    @wedding = Wedding.find(params[:id])
  end

  def wedding_params
    params.require(:wedding).permit(:welcome_message,
                                    :address, :address_number, :address_location, :wedding_info,
                                    :date, :time, :partner_first_name,
                                    :partner_last_name, :partner_email, :partner_profile,
                                    :partner_phone, :couple_photo, :partner_one_photo,
                                    :partner_two_photo)
  end
end
