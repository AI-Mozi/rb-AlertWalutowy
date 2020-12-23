class ConfirmationsController < Devise::ConfirmationsController
  private

  def after_confirmation_path_for(resource_name, resource)
    sign_in(resource) 
    new_user_currency_path
  end
end