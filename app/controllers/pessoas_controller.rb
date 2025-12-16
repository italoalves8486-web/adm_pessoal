class PessoasController < ApplicationController
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


  def pessoa_params
    params.require(:pessoa).permit(:nome, :cpf, :rg, :email, :telefone)
  end
end
