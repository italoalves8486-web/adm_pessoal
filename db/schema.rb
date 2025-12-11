# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2025_12_09_124144) do
  create_table "enderecos", force: :cascade do |t|
    t.string "cep"
    t.string "cidade"
    t.datetime "created_at", null: false
    t.string "numero"
    t.integer "pessoa_id", null: false
    t.string "rua"
    t.datetime "updated_at", null: false
    t.index ["pessoa_id"], name: "index_enderecos_on_pessoa_id"
  end

  create_table "pessoas", force: :cascade do |t|
    t.string "cpf"
    t.datetime "created_at", null: false
    t.string "email"
    t.string "nome"
    t.string "rg"
    t.string "telefone"
    t.datetime "updated_at", null: false
    t.index ["cpf"], name: "index_pessoas_on_cpf", unique: true
    t.index ["email"], name: "index_pessoas_on_email", unique: true
    t.index ["rg"], name: "index_pessoas_on_rg", unique: true
  end

  add_foreign_key "enderecos", "pessoas"
end
