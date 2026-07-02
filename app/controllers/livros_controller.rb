class LivrosController < ApplicationController
  before_action :set_livro, only: %i[ show update destroy ]

  # GET /livros
  def index
    @filtro = Livro.ransack(params[:filtro])
    @livros = @filtro.result

    render json: LivroBlueprint.render(@livros), status: :ok
  end

  # GET /livros/1
  def show
    render json: LivroBlueprint.render(@livro, view: :para_controller)
  end

  # POST /livros
  def create
    @livro = Livro.new(livro_params)

    if @livro.save
      render json: @livro, status: :created, location: @livro
    else
      render json: @livro.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /livros/1
  def update
    if @livro.update(livro_params)
      render json: @livro
    else
      render json: @livro.errors, status: :unprocessable_content
    end
  end

  # DELETE /livros/1
  def destroy
    @livro.destroy!
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
