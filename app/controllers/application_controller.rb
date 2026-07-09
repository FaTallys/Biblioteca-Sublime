class ApplicationController < ActionController::API
  include Pundit::Authorization

  def pundit_user
    current_pessoa
  end
end
