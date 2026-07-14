class AutorsController < ApplicationController
  before_action :set_autor, only: %i[ show update destroy ]
  before_action :authenticate_pessoa!

  # GET /autors
  def index
    @q = Autor.ransack(params[:q])
    @autors = @q.result
    render json: AutorBlueprint.render(@autors), status: :ok
  end

  # GET /autors/1
  def show
    render json: AutorBlueprint.render(@autor), status: :ok
  end

  # POST /autors
  def create
    authorize Autor, :create?
    validador = AutorContrato.new.call(autor_params.to_h)

    if validador.success?
      @autor = Autor.create!(validador.to_h)
      render json: AutorBlueprint.render(@autor), status: :created
    else
      render json: { erros: validador.errors.to_h }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /autors/1
  def update
    authorize @autor
    validador = AutorContrato.new.call(autor_params.to_h)
    if validador.success?
      @autor.update!(validador.to_h)
      render json: AutorBlueprint.render(@autor)
    else
      render json: { erros: validador.errors.to_h }, status: :unprocessable_entity
    end
  end

  # DELETE /autors/1
  def destroy
    authorize @autor

    @autor.destroy!

    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_autor
      @autor = Autor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def autor_params
      params.require(:autor).permit(:nome,
       livros_attributes: [ :id, :nome, :copias, :tipo_literario, :editora_id ]
      )
    end
end
