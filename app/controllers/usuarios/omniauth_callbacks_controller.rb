class Usuarios::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @usuario = Usuario.find_for_facebook_oauth(request.env["omniauth.auth"], current_usuario)

    if @usuario.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect @usuario, :event => :authentication
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end