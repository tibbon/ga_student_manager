class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    user = User.find_for_oauth(request.env["omniauth.auth"])
    if user
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", kind: "Github"
      session[:user_id] = user.id
      binding.pry
      sign_in_and_redirect user, event: :authentication
    else
      # I think this is causing an error. Cookies can't be that big. Save specific items, not the entire hash.
      session["devise.github_data"] = request.env["omniauth.auth"]
      binding.pry
      redirect_to new_user_registration_url
    end
  end
end