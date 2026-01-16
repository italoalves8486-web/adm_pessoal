class PessoasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pessoa, only: %i[show edit update destroy]

  def index
    @q = Pessoa.ransack(params[:q])
    @pessoas = @q.result
  end

  def show
  end

  def new
    @pessoa = Pessoa.new
  end

  def create
    @pessoa = Pessoa.new(pessoa_params)

    if @pessoa.save
      redirect_to @pessoa, notice: "Pessoa cadastrada com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @pessoa.update(pessoa_params)
      redirect_to @pessoa, notice: "Pessoa atualizada com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

def destroy
  @pessoa = Pessoa.find(params[:id])
  @pessoa.destroy

  respond_to do |format|
    # O status: :see_other é essencial para o Turbo entender o redirecionamento após um DELETE
    format.html { redirect_to pessoas_path, status: :see_other, notice: "Pessoa excluída com sucesso." }
    format.json { head :no_content }
  end
end

  private

  def set_pessoa
    @pessoa = Pessoa.find(params[:id])
  end

  def pessoa_params
    params.require(:pessoa).permit(:nome, :cpf, :rg, :email, :telefone)
  end
end
