class PessoasController < ApplicationController
  # Executa set_pessoa antes das ações especificadas
  before_action :set_pessoa, only: %i[show edit update destroy]

  def index
    @pessoas = Pessoa.all
  end

  def show
  end

  def new
    @pessoa = Pessoa.new
  end

  # MÉTODO CREATE UNIFICADO E CORRIGIDO
  def create
    @pessoa = Pessoa.new(pessoa_params)

    if @pessoa.save
      # Flash message definida no redirect_to
      redirect_to @pessoa, notice: "Pessoa cadastrada com sucesso!"
    else
      # Se falhar, renderiza o formulário NEW novamente, exibindo os erros
      render :new
    end
  end

  def edit
  end

  def update
    if @pessoa.update(pessoa_params)
      redirect_to @pessoa, notice: "Pessoa atualizada com sucesso."
    else
      render :edit
    end
  end

  def destroy
    @pessoa.destroy
    redirect_to pessoas_url, notice: "Pessoa apagada com sucesso."
  end

  private

  def set_pessoa
    @pessoa = Pessoa.find(params[:id])
  end

  # Strong Parameters: permite apenas os atributos seguros
  def pessoa_params
    params.require(:pessoa).permit(:nome, :cpf, :rg, :email, :whatsapp)
  end
end
