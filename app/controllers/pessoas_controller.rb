class PessoasController < ApplicationController
  before_action :set_pessoa, only: %i[ show update destroy ]
  before_action :authenticate_pessoa!

  # GET /pessoas
  def index
    @filtro = policy_scope(Pessoa)
    @q = @filtro.ransack(params[:q])
    @pessoas = @q.result

    render json: PessoaBlueprint.render(@pessoas, view: :normal), status: :ok
  end

  # GET /pessoas/1
  def show
    authorize @pessoa

    render json: PessoaBlueprint.render(@pessoa, view: :normal)
  end

  # POST /pessoas
  def create
    authorize Pessoa, :create?
    dados_validador = pessoa_params.to_h.deep_symbolize_keys
    validador = PessoaContrato.new.call(dados_validador)
    if validador.success?
      @pessoa = Pessoa.create!(validador.to_h)
      render json: PessoaBlueprint.render(@pessoa, view: :normal), status: :created
    else
      render json: { erros: validador.errors.to_h }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pessoas/1
  def update
    authorize @pessoa
    dados_validador = pessoa_params.to_h.deep_symbolize_keys
    validador = PessoaContrato.new.call(dados_validador)

    if validador.success?
      @pessoa.update!(validador.to_h)
      render json: PessoaBlueprint.render(@pessoa, view: :normal), status: :ok
    else
      render json: { erros: validador.errors.to_h }, status: :unprocessable_entity
    end
  end

  # DELETE /pessoas/1
  def destroy
    authorize @pessoa
    @pessoa.destroy!

    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pessoa
      @pessoa = policy_scope(Pessoa).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pessoa_params
      params.require(:pessoa).permit(:nome, :idade, :email, :password, :password_confirmation, :cargo_id)
    end
end
