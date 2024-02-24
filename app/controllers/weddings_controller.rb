class WeddingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @wedding = Wedding.find(params[:wedding_id])
    if @wedding
      render partial: "weddings/custom", locals: { wedding: @wedding }
    else
      redirect_to root_path
    end
  end
end
