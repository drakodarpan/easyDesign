class OmniauthCallbacksController < ApplicationController
  def facebook
    auth = request.env["Omniauth.auth"]

    data = {
      :nombre => auth.info.first_name,
      :apellido => auth.info.last_name,
      :username => auth.info.nickname,
      :email => auth.info.email,
      :provider => auth.provider,
      :uid => auth.uid
    }

    @usuario = Usuario.find_or_creat_by_omniauth(data)

    if @usaurio.persisted?
      sign_in_and_redirect @usuario, :event => :authentication
    else
      session[:Omniauth_errors] = @usuario.errors.full_messages.to_sentence unless @usuario.save

      session[:Omniauth_data] = data

      redirect_to new_usuario_registration_url
    end
  end
end