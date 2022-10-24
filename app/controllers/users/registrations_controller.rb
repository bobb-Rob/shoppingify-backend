class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render json: { 
      status: { code: 200, 
        message: 'Signed up successfully', 
        data: resource }
    }, status: :ok     
  end

  def register_failed
    render json: { 
      status: { 
        code: 500, 
        message: 'User could not be Created successfully',
        error: resource.errors.full_messages } ,
        status: :unprocessable_entity        
    }
  end
end
