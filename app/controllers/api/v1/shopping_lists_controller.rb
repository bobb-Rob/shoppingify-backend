class Api::V1::ShoppingListsController < ApiController

  def index    
    # render json: { 
    #   code: 200, 
    #   shopping_list: current_user.shopping_lists 
    # }
    # # @shopping_lists = shopping_lists.map do |shopping_list|
    # #   shopping_list.items
    # end
    render json: { 
      code: 200,     
      shopping_lists: current_user.shopping_lists,
      data: resources
    }, status: :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: { code: 404, message: e.message }, status: :not_found
  end

end