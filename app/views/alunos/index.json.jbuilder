json.array!(@alunos) do |aluno|
  json.extract! aluno, :id, :nome, :matricula, :curso_id
  json.url aluno_url(aluno, format: :json)
end
