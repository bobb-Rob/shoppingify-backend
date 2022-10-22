class ItemsController < ApplicationController
  before_action :authenticate_user!
  # GET /items
  # GET /items.xml
  def index
    @items = Item.find(:all)
    render json: { message: "If you see this, you're in!", items: @items }
  end  
end
