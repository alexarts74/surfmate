class Api::RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token
  respond_to :json

  # POST /api/users
  def create
    build_resource(sign_up_params)

    if resource.save
      render json: { message: 'Inscription réussie !', user: resource }
    else
      render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :age, :level, :bio, :image)
  end
end
