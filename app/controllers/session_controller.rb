class SessionController < ApplicationController
  def create
    form = UserForm.new(request.env["omniauth.auth"])
    user = User.find_or_create_by!(form.model_attributes)
    session[:user_id] = user.id
    redirect_to(:exercises)
  end

  def destroy
    session[:user_id] = nil
    redirect_to(:root)
  end
end
