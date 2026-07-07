class ApplicationController < ActionController::API
  include Pundit::Authorization

  def current_user
    Pessoa.find_by(cargo_id: 3)
  end
end
