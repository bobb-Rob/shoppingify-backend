class ItemsController < ApplicationController
  # GET /items
  # GET /items.xml
  def index
    @items = Item.find(:all)

    respond_to do |format|      
      format.json  { render :json => @items.to_json }
    end
  end


  # GET /items/new
  def new
    @item = Item.new
    respond_to do |format|
      format.json  { render :json => @item.to_json }
    end
  end


  

  
end
