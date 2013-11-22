class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    user = User.find_for_oauth(request.env["omniauth.auth"])
    if user
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", kind: "Github"
      session[:user_id] = user.id
      sign_in_and_redirect user, event: :authentication
    else
      session["devise.github_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end