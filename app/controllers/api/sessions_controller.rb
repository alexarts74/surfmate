# app/controllers/api/sessions_controller.rb
class Api::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token
  respond_to :json

  # POST /api/users/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)

    # Si la connexion réussit, renvoie une réponse JSON avec un message de succès et les détails de l'utilisateur connecté
    render json: { message: 'Connexion réussie !', user: resource }
  end

  # DELETE /api/users/sign_out
  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    render json: { message: 'Déconnexion réussie !' }
  end

  # Autres actions spécifiques au contrôleur...
end
