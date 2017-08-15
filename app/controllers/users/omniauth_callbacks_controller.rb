class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    riser = Riser.find_for_facebook_oauth(request.env['omniauth.auth'])

    if riser.persisted?
      sign_in_and_redirect riser, event: :authentication
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_riser_registration_url
    end
  end
end
