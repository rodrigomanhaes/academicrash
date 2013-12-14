# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131214165805) do

  create_table "alunos", force: true do |t|
    t.string   "nome"
    t.string   "matricula"
    t.integer  "curso_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "alunos", ["curso_id"], name: "index_alunos_on_curso_id"

  create_table "cursos", force: true do |t|
    t.string   "nome"
    t.string   "codigo"
    t.integer  "semestres"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "disciplinas", force: true do |t|
    t.string   "nome"
    t.string   "codigo"
    t.integer  "curso_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "disciplinas", ["curso_id"], name: "index_disciplinas_on_curso_id"

  create_table "horarios", force: true do |t|
    t.integer  "dia"
    t.string   "hora"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "horarios_turmas", id: false, force: true do |t|
    t.integer "turma_id",   null: false
    t.integer "horario_id", null: false
  end

  create_table "professores", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "turmas", force: true do |t|
    t.integer  "professor_id"
    t.integer  "disciplina_id"
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "turmas", ["disciplina_id"], name: "index_turmas_on_disciplina_id"
  add_index "turmas", ["professor_id"], name: "index_turmas_on_professor_id"

end
