class EmprestimosController < ApplicationController
  before_action :set_emprestimo, only: %i[ show update destroy ]

  # GET /emprestimos
  def index
    @emprestimos = Emprestimo.all

    render json: @emprestimos
  end

  # GET /emprestimos/1
  def show
    render json: @emprestimo
  end

  # POST /emprestimos
  def create
    pessoa = Pessoa.find(params[:pessoa_id])

    pessoa.pegar_livro(params[:livro_id])

    render json: { message: "Empréstimo realizado com sucesso" }
  rescue => e
    render json: { error: e.message }, status: :unprocessable_entity
  end
  
  # PATCH/PUT /emprestimos/1
  def update
    if @emprestimo.update(emprestimo_params)
      render json: @emprestimo
    else
      render json: @emprestimo.errors, status: :unprocessable_content
    end
  end

  # DELETE /emprestimos/1
  def destroy
    @emprestimo.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emprestimo
      @emprestimo = Emprestimo.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def emprestimo_params
      params.fetch(:emprestimo, {})
    end
end
