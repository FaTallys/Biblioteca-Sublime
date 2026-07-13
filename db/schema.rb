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

ActiveRecord::Schema[8.1].define(version: 2026_07_13_171922) do
  create_table "autors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "nome"
    t.datetime "updated_at", null: false
  end

  create_table "cargos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "nome"
    t.datetime "updated_at", null: false
  end

  create_table "editoras", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "data_fundacao"
    t.string "nome"
    t.datetime "updated_at", null: false
  end

  create_table "emprestimos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "data_devolucao"
    t.integer "livro_id", null: false
    t.integer "pessoa_id", null: false
    t.integer "status_devolucao", default: 0
    t.datetime "updated_at", null: false
    t.index ["livro_id"], name: "index_emprestimos_on_livro_id"
    t.index ["pessoa_id"], name: "index_emprestimos_on_pessoa_id"
  end

  create_table "livros", force: :cascade do |t|
    t.integer "autor_id"
    t.integer "copias"
    t.datetime "created_at", null: false
    t.integer "editora_id"
    t.boolean "emprestar"
    t.string "nome"
    t.string "tipo_literario"
    t.datetime "updated_at", null: false
    t.index ["autor_id"], name: "index_livros_on_autor_id"
    t.index ["editora_id"], name: "index_livros_on_editora_id"
  end

  create_table "pessoas", force: :cascade do |t|
    t.integer "cargo_id"
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "idade"
    t.string "nome"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["cargo_id"], name: "index_pessoas_on_cargo_id"
    t.index ["email"], name: "index_pessoas_on_email", unique: true
    t.index ["reset_password_token"], name: "index_pessoas_on_reset_password_token", unique: true
  end

  add_foreign_key "emprestimos", "livros"
  add_foreign_key "emprestimos", "pessoas"
  add_foreign_key "livros", "autors"
  add_foreign_key "livros", "editoras"
  add_foreign_key "pessoas", "cargos"
end
