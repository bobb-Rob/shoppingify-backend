class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render json: { 
      code: 200, 
      message: 'You are logged in.', 
      user: current_user
    }, 
      status: :ok
  end

  def respond_to_on_destroy
    log_out_success && return if current_user

    log_out_failure
  end

  def log_out_success
    render json: { 
      code: 200, 
      message: "You have logged out successfully." }, 
      status: :ok
  end

  def log_out_failure
    render json: {
      code: 401, 
      message: "User has no active session, Hmm nothing happened."}, 
      status: :unauthorized
  end
end
