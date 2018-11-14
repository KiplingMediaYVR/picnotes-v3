class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :initiate_instance_variables

  def initiate_instance_variables
    @note = Note.new
  end
  helper_method :initiate_instance_variables
end
