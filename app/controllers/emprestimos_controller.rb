class EmprestimosController < ApplicationController
  before_action :set_emprestimo, only: %i[ show update destroy ]

  # GET /emprestimos
  def index
    @emprestimos = Emprestimo.all

    if params[:pessoa_id].present?
      @emprestimos = @emprestimos.where(pessoa_id: params[:pessoa_id])
    end

    if params[:pessoa_nome].present?
    @emprestimos = @emprestimos.joins(:pessoa).where("pessoas.nome LIKE ?", "%#{params[:pessoa_nome]}%")
    end

  if params[:livro_nome].present?
    @emprestimos = @emprestimos.joins(:livro).where("livros.nome LIKE ?", "%#{params[:livro_nome]}%")
  end

    render json: @emprestimos
  end

  # GET /emprestimos/1
  def show
    render json: @emprestimo
  end

  # POST /emprestimos
  def create
    service = Emprestimos::CriarEmprestimo.new(
      emprestimo_params[:livro_id],
      emprestimo_params[:pessoa_id])
    service.call

    render json: { message: "Empréstimo realizado com sucesso " }
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
    service = Emprestimos::DevolverEmprestimo.new(@emprestimo.id)
    service.call
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emprestimo
      @emprestimo = Emprestimo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def emprestimo_params
      params.require(:emprestimo).permit(:livro_id, :pessoa_id)
    end
end
