module PessoaRoles
  extend ActiveSupport::Concern
  included do
    delegate :admin?, :bibliotecario?, :leitor?, to: :cargo, allow_nil: true
  end
end
