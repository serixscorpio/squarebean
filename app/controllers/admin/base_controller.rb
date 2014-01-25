class Admin::BaseController < ApplicationController
  layout 'admin'

  before_filter :verify_admin
  
  private
  
  def verify_admin
    redirect_to new_user_session_path unless current_user
  end
  # other logic applicable to all controllers within the admin
  # namespace can be placed here
end
