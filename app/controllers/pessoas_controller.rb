class PessoasController < ApplicationController
  before_action :set_pessoa, only: %i[ show update destroy ]

  # GET /pessoas
  def index
    @filtro = Pessoa.ransack(params[:q])
    @pessoas = @filtro.result

    render json: PessoaBlueprint.render(@pessoas, view: :para_controller), status: :ok
  end

  # GET /pessoas/1
  def show
    @pessoa = Pessoa.find(params[:id])
    render json: PessoaBlueprint.render(@pessoa, view: :para_controller)
  end

  # POST /pessoas
  def create
    validador = PessoaContrato.new.call(params[:pessoa].to_h)
    if validador.success?
      @pessoa = Pessoa.create!(validador.to_h)
      render json: PessoaBlueprint.render(@pessoa, view: :para_controller), status: :created
    else
      render json: { erros: validador.errors.to_h }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pessoas/1
  def update
    validador = PessoaContrato.new.call(params[:pessoa].to_h)

    if validador.success?
      @pessoa.update!(validador.to_h)
      render json: PessoaBlueprint.render(@pessoa, view: :para_controller), status: :ok
    else
      render json: { erros: validador.errors.to_h }, status: :unprocessable_entity
    end
  end

  # DELETE /pessoas/1
  def destroy
    @pessoa.destroy!

    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pessoa
      @pessoa = Pessoa.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def pessoa_params
      params.expect(pessoa: [ :nome, :idade ])
    end
end
