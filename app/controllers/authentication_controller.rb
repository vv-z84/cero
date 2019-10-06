class AuthenticationController < ApiController
  skip_before_action :authenticate_request

  def create
    result = CreateUser.new(User).call(user_params)

    if result.errors.empty?
      response = { data: result, status: :created }
    else
      response = { data: result.errors, status: :bad_request }
    end

    respond_to do |format|
        format.json { render json: response[:data], status: response[:status] }
    end
  end

  def authenticate
    command = AuthenticateUser.call(user_params[:email], user_params[:password])

    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  private
  def user_params
    params.permit(:email, :password)
  end
 end
