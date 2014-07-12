class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_menu

  def set_menu
    @menu_active = self.class.name.gsub(/Controller/, '').singularize.downcase.to_sym
  end

end
