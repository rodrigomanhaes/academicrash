class PlanosDeEstudosController < ApplicationController
  before_action :carregar_aluno

  def new
    @plano_de_estudos = PlanoDeEstudos.new
  end

  def create
    @plano_de_estudos = PlanoDeEstudos.new(
      periodo: params[:periodo],
      aluno: @aluno,
      matriculas_attributes: matriculas_attributes)
    if @plano_de_estudos.save
      redirect_to [@aluno, @plano_de_estudos]
    else
      render 'new'
    end
  end

  def show
    @plano_de_estudos = PlanoDeEstudos.find(params[:id])
  end

  private

  def carregar_aluno
    @aluno = Aluno.find(params[:aluno_id])
  end

  def matriculas_attributes
    params[:turma_ids].map do |turma_id|
      { turma_id: turma_id }
    end
  end
end