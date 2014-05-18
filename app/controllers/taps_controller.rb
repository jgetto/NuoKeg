class TapsController < ApplicationController
  def index
    @taps = Tap.all
  end

  def show
    @tap = Tap.find(params[:id])
    respond_to do |format|
      format.html 
      format.json { render json: @tap }
    end
  end

  def tap
  end

  def finish
  end
end
