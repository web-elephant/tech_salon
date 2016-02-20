class Cliant::Base < ApplicationController
  private
  def current_cliant
    if session[:cliant_id]
      @current_cliant ||= Cliant.find_by(id: session[:cliant_id])
    end
  end

  helper_method :current_cliant
end