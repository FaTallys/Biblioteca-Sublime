class EmprestimosController < ApplicationController
  before_action :set_emprestimo, only: %i[ show update destroy ]

  # GET /emprestimos
  def index
    @filtro = Emprestimo.ransack(params[:filtro])
    @emprestimos = @filtro.result

    render json: EmprestimoBlueprint.render(@emprestimos, view: :normal), status: :ok
  end

  # GET /emprestimos/1
  def show
    render json: EmprestimoBlueprint.render(@emprestimo, view: :normal), status: :ok
  end

  # POST /emprestimos
  def create
    service = Emprestimos::CriarEmprestimo.new(
      emprestimo_params[:livro_id],
      emprestimo_params[:pessoa_id]).call

    render json: service, status: :created
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
