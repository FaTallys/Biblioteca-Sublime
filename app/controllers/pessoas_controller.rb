class PessoasController < ApplicationController
  before_action :set_pessoa, only: %i[ show update destroy ]

  # GET /pessoas
  def index
    @pessoas = Pessoa.all

    render json: PessoaBlueprint.render(@pessoas, view: :para_controller), status: :ok
  end

  # GET /pessoas/1
  def show
    @pessoa = Pessoa.find(params[:id])
    render json: PessoaBlueprint.render(@pessoa, view: :para_controller)
  end

  # POST /pessoas
  def create
    @pessoa = Pessoa.new(pessoa_params)

    if @pessoa.save
      render json: @pessoa, status: :created, location: @pessoa
    else
      render json: @pessoa.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /pessoas/1
  def update
    if @pessoa.update(pessoa_params)
      render json: @pessoa
    else
      render json: @pessoa.errors, status: :unprocessable_content
    end
  end

  # DELETE /pessoas/1
  def destroy
    @pessoa.destroy!
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
