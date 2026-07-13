class EditorasController < ApplicationController
  before_action :set_editora, only: %i[ show update destroy ]
  before_action :authenticate_pessoa!

  # GET /editoras
  def index
    @q = Editora.ransack(params[:q])
    @editoras = @q.result
    render json: EditoraBlueprint.render(@editoras), status: :ok
  end

  # GET /editoras/1
  def show
    render json: EditoraBlueprint.render(@editora), status: :ok
  end

  # POST /editoras
  def create
    authorize Editora, :create?
    validador = EditoraContrato.new.call(editora_params.to_h)

    if validador.success?
      @editora = Editora.create!(validador.to_h)
      render json: EditoraBlueprint.render(@editora), status: :created
    else
      render json: { erros: validador.errors.to_h }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /editoras/1
  def update
    authorize @editora
    validador = EditoraContrato.new.call(editora_params.to_h)
    if validador.success?
      @editora.update!(validador.to_h)
      render json: EditoraBlueprint.render(@editora), status: :ok
    else
      render json: { erros: validador.errors.to_h }, status: :unprocessable_entity
    end
  end

  # DELETE /editoras/1
  def destroy
    authorize @editora

    @editora.destroy!

    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_editora
      @editora = Editora.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def editora_params
      params.require(:editora).permit(:nome, :data_fundacao)
    end
end
