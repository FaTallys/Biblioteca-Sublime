class EmprestimosController < ApplicationController
  before_action :set_emprestimo, only: %i[ show update destroy ]
  before_action :authenticate_pessoa!

  # GET /emprestimos
  def index
    @filtro = policy_scope(Emprestimo)
    @q = @filtro.ransack(params[:q])
    @emprestimos = @q.result

    render json: EmprestimoBlueprint.render(@emprestimos, view: :normal), status: :ok
  end

  # GET /emprestimos/1
  def show
    authorize @emprestimo
    render json: EmprestimoBlueprint.render(@emprestimo, view: :normal), status: :ok
  end

  # POST /emprestimos
  def create
    authorize Emprestimo, :create?
    validador = EmprestimoContrato.new.call(emprestimo_params.to_h)
    if validador.success?
      @emprestimo = Emprestimos::CriarEmprestimo.new(
        validador.to_h[:livro_id],
        validador.to_h[:pessoa_id]).call
        render json: EmprestimoBlueprint.render(@emprestimo, view: :normal), status: :created
    else
      render json: { erros: validador.errors.to_h }, status: :unprocessable_entity
    end
  rescue => e
    render json: { erro_sistema: e.message }, status: :internal_server_error
  end

  # PATCH/PUT /emprestimos/1
  def update
    authorize @emprestimo
    validador = EmprestimoContrato.new.call(emprestimo_params.to_h)
    if validador.success?
      @emprestimo.update!(validador.to_h)
      render json: EmprestimoBlueprint.render(@emprestimo, view: :normal)
    else
      render json: { erros: validador.errors.to_h }, status: :unprocessable_entity
    end
  end

  # DELETE /emprestimos/1
  def destroy
    authorize @emprestimo
  Emprestimos::DevolverEmprestimo.new(@emprestimo.id).call
  head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emprestimo
      @emprestimo = policy_scope(Emprestimo).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def emprestimo_params
      params.require(:emprestimo).permit(:livro_id, :pessoa_id)
    end
end
