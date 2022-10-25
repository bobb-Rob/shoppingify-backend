class Api::V1::ItemsController < ApiController  
  before_action :set_item, only: [:destroy]

  def index
    @items = current_user.items
    render json: { message: "If you see this, you're in!", items: @items }
  end

  def create
    @item = current_user.items.create!(item_params)
    if @item.save
      render json: { message: "Item created!", item: @item }, status: :created
    else
      render json: { 
        message: "Item not created", 
        item: @item.errors.full_messages
      }, 
        status: :unprocessable_entity
    end
  end

  def destroy    
    if @item.destroy
      render json: { message: "Item deleted!", item: @item }, status: :ok
    else
      render json: { 
        message: "Item not deleted", 
        item: @item.errors.full_messages
      }, 
        status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = current_user.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :image, :note , :category_id, :user_id)
  end
end
