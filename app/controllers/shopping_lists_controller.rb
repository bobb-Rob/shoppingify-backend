class ShoppingListsController < ApplicationController
  before_action :authenticate_user!

  def index
    shopping_lists = current_user.shopping_lists
    
    @shopping_lists = shopping_lists.map do |shopping_list|
      shopping_list.items
    end
    render json: { code: 200, 
      message: "If you see this, you're in!", 
      shopping_lists: @shopping_lists 
    }, status: :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: { code: 404, message: e.message }, status: :not_found
  end

end