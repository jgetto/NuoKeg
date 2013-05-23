# coding: utf-8

require 'BreweryDB'

class BeersController < ApplicationController
  def search
    @beers = []
    res = BreweryDB.search(params[:q])
    
    unless res['data']
      head :ok
      return
    end
    
    res['data'].each do |beer_hash|
      beer = Beer.find_by_guid(beer_hash['id']) || Beer.create_from_hash(beer_hash)  
      if beer
        @beers << beer
      end
    end
    if @beers.count > 0
      render :json => {:success => true, :html => (render_to_string @beers).force_encoding('UTF-8') }
    else
      head :ok
    end
  end
  
  def instant
    q = params['q']
    limit = params['limit'] || 25
    offset = params['offset'] || 0
    @beers = Beer.joins(:brewery).where("beers.name CONTAINING ? OR breweries.name CONTAINING ?", q, q).limit(limit).offset(offset)
    render :json => {:success => true, :html => (render_to_string @beers).force_encoding('UTF-8') }
  end
  
  # GET /beers
  # GET /beers.json
  def index
    @beers = Beer.paginate(:page => params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.js   # index.js.erb
      format.json { render json: @beers }
    end
  end

  # GET /beers/1
  # GET /beers/1.json
  def show
    @beer = Beer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @beer }
    end
  end

  # GET /beers/new
  # GET /beers/new.json
  def new
    @beer = Beer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @beer }
    end
  end

  # GET /beers/1/edit
  def edit
    @beer = Beer.find(params[:id])
  end

  # POST /beers
  # POST /beers.json
  def create
    @beer = Beer.new(params[:beer])

    respond_to do |format|
      if @beer.save
        format.html { redirect_to @beer, notice: 'Beer was successfully created.' }
        format.json { render json: @beer, status: :created, location: @beer }
      else
        format.html { render action: "new" }
        format.json { render json: @beer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /beers/1
  # PUT /beers/1.json
  def update
    @beer = Beer.find(params[:id])

    respond_to do |format|
      if @beer.update_attributes(params[:beer])
        format.html { redirect_to @beer, notice: 'Beer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @beer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /beers/1
  # DELETE /beers/1.json
  def destroy
    @beer = Beer.find(params[:id])
    @beer.destroy

    respond_to do |format|
      format.html { redirect_to beers_url }
      format.json { head :no_content }
    end
  end
end
