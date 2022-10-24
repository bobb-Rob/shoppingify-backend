class ItemsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @items = current_user.items
    render json: { message: "If you see this, you're in!", items: @items }
  end  
end
