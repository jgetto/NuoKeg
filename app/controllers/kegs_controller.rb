# coding: utf-8

class KegsController < ApplicationController
  
  def current
    @keg = Keg.where(:is_on_tap => true).first
    respond_to do |format|
      format.html { render :action => 'show' }
      format.json { render json: @keg }
    end
  end
  
  def tap
    Keg.where(:is_on_tap => true).each do |old_keg|
      old_keg.end_date = Time.now
      old_keg.is_on_tap = false
      old_keg.save
    end
    
    @keg = Keg.find(params[:id])
    unless @keg.start_date == nil && @keg.end_date == nil && !@keg.is_on_tap
      redirect_to kegs_current_path
      return
    end
    @keg.start_date = Time.now
    @keg.is_on_tap = true
    @keg.save
    
    client = Twitter::Client.new(:consumer_key => ENV["TWITTER_CONSUMER_KEY"],
                                 :consumer_secret => ENV["TWITTER_CONSUMER_SECRET"],
                                 :oauth_token => ENV["TWITTER_OAUTH_TOKEN"],
                                 :oauth_token_secret => ENV["TWITTER_OAUTH_TOKEN_SECRET"])
    client.update("Just tapped a keg of #{@keg.beer.brewery ? @keg.beer.brewery.name + "'s" : ''} #{@keg.beer.name}")
    
    flash[:notice] = "Tapped a keg of #{@keg.beer.name}"
    redirect_to kegs_current_path
  end
  
  def finish
    @keg = Keg.find(params[:id])
    @keg.end_date = Time.now
    @keg.is_on_tap = false
    @keg.save

    flash[:notice] = "Finished a keg of #{@keg.beer.name}"
    redirect_to kegs_path
  end
  
  def index
    @current_kegs = Keg.current
    @past_kegs = Keg.past
    respond_to do |format|
      format.html 
      format.json { render json: @current_kegs }
    end
  end

  def show
    @keg = Keg.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render json: @keg }
    end
  end

  def new
    @keg = Keg.new

    respond_to do |format|
      format.html
      format.json { render json: @keg }
    end
  end

  def edit
    @keg = Keg.find(params[:id])
  end

  def create
    @keg = Keg.new(params[:keg])
    @keg.beer.name.force_encoding('UTF-8')
    respond_to do |format|
      if @keg.save
        
        format.html { redirect_to kegs_path, notice: "Added a keg of #{@keg.beer.name}" }
        format.json { render json: @keg, :include => :beer, status: :created, location: @keg }
      else
        format.html { render action: "new" }
        format.json { render json: @keg.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @keg = Keg.find(params[:id])

    respond_to do |format|
      if @keg.update_attributes(params[:keg])
        format.html { redirect_to @keg, notice: 'Keg was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @keg.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @keg = Keg.find(params[:id])
    @keg.destroy

    respond_to do |format|
      format.html { redirect_to kegs_url }
      format.json { head :no_content }
    end
  end
end
