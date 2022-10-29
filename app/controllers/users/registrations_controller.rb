class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json 

  private

  def respond_with(resource, _opts = {})
    # build_resource(registration_params)
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
      response: { 
        code: 500, 
        message: 'User could not be Created successfully',
        error: resource.errors.full_messages },             
    }, status: :unprocessable_entity   
  end

  # def registration_params
  #   params.require(:user).permit(:email, :username, :password)
  # end
end
