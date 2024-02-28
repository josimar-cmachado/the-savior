class WeddingsController < ApplicationController
  before_action :set_wedding, only: %i[edit update destroy]
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @wedding = Wedding.find(params[:wedding_id])
    if @wedding
      render partial: "weddings/custom", locals: { wedding: @wedding }
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
      redirect_to user_profile_path(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @wedding.update(wedding_params)
      redirect_to user_profile_path(current_user)
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
                                    :address, :wedding_info,
                                    :tips, :date, :time, :partner_full_name,
                                    :partner_email, :partner_profile,
                                    :partner_phone)
  end
end
