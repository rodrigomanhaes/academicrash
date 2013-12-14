class TurmasController < ApplicationController
  def new
    @turma = Turma.new
  end

  def create
    @turma = Turma.new(params_turma)
    if @turma.save
      redirect_to @turma
    else
      render 'new'
    end
  end

  def show
    @turma = Turma.find(params[:id])
  end

  private

  def params_turma
    params.require(:turma).
      permit(:nome, :disciplina_id, :professor_id, horario_ids: [])
  end
end