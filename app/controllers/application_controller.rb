class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :reset_session instead.
  protect_from_forgery with: :exception

  include ExhibitsHelper

  helper :exhibits

  def humor
    Humor.new
  end
end
