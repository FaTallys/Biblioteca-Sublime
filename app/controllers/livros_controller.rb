class LivrosController < ApplicationController
  before_action :set_livro, only: %i[ show update destroy ]

  # GET /livros
  def index
    @filtro = Livro.ransack(params[:q])
    @livros = @filtro.result

    render json: LivroBlueprint.render(@livros), status: :ok
  end

  # GET /livros/1
  def show
    render json: LivroBlueprint.render(@livro, view: :para_controller)
  end

  # POST /livros
  def create
    validador = LivroContrato.new.call(params[:livro].to_h)
    if validador.success?
      @livro = Livro.create!(validador.to_h)
      render json: LivroBlueprint.render(@livro), status: :created
    else
      render json: { erros: validador.errors.to_h }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /livros/1
  def update
    validador = LivroContrato.new.call(params[:livro].to_h)
    if validador.success?
      @livro.update!(validador.to_h)
      render json: LivroBlueprint.render(@livro), status: :ok
    else
      render json: { erros: validador.errors.to_h }, status: :unprocessable_entity
    end
  end

  # DELETE /livros/1
  def destroy
    @livro.destroy!

    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_livro
      @livro = Livro.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def livro_params
      params.require(:livro).permit(:autor, :nome, :copias, :emprestar)
    end
end
