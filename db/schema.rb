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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120405041937) do

  create_table "agendas", :force => true do |t|
    t.string   "nome"
    t.integer  "condominio_id"
    t.string   "slug"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "apartamentos", :force => true do |t|
    t.integer  "numero"
    t.integer  "predio_id"
    t.integer  "condominio_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "avisos", :force => true do |t|
    t.text     "corpo"
    t.integer  "condominio_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "banners", :force => true do |t|
    t.string   "url"
    t.string   "path"
    t.integer  "parceiro_id"
    t.datetime "data"
    t.boolean  "ativo"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "imagem_file_name"
    t.string   "imagem_content_type"
    t.integer  "imagem_file_size"
    t.datetime "imagem_updated_at"
  end

  create_table "campanhas", :force => true do |t|
    t.integer  "parceiro_id"
    t.string   "publicidade_tipo"
    t.integer  "publicidade_id"
    t.datetime "data_inicio"
    t.datetime "data_fim"
    t.integer  "pageviews"
    t.integer  "clicks"
    t.boolean  "ativo"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "comments", :force => true do |t|
    t.integer  "owner_id",         :null => false
    t.integer  "commentable_id",   :null => false
    t.string   "commentable_type", :null => false
    t.text     "body",             :null => false
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "condominios", :force => true do |t|
    t.string   "nome",                                 :null => false
    t.string   "endereco"
    t.string   "lat"
    t.string   "lon"
    t.string   "slug"
    t.boolean  "moderacao",         :default => false
    t.boolean  "privado",           :default => true
    t.boolean  "user_visibilidade", :default => true
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  add_index "condominios", ["slug"], :name => "index_condominios_on_slug", :unique => true

  create_table "eventos", :force => true do |t|
    t.string   "agenda_id"
    t.string   "titulo"
    t.text     "descricao"
    t.integer  "status"
    t.integer  "usuario_id"
    t.date     "dia"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "murais", :force => true do |t|
    t.string   "titulo",                           :null => false
    t.text     "corpo",                            :null => false
    t.integer  "usuario_id",                       :null => false
    t.integer  "condominio_id",                    :null => false
    t.boolean  "comentavel",    :default => true,  :null => false
    t.boolean  "publico",       :default => false, :null => false
    t.integer  "parent_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "ofertas", :force => true do |t|
    t.string   "titulo"
    t.text     "descricao"
    t.datetime "data"
    t.string   "preco_de"
    t.string   "preco_por"
    t.integer  "parceiro_id"
    t.boolean  "ativo"
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "paginas", :force => true do |t|
    t.string   "titulo",                          :null => false
    t.text     "corpo",                           :null => false
    t.boolean  "chamada",       :default => true, :null => false
    t.boolean  "ativo",         :default => true, :null => false
    t.integer  "usuario_id",                      :null => false
    t.integer  "condominio_id",                   :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "parceiros", :force => true do |t|
    t.string   "nome"
    t.string   "endereco"
    t.string   "email"
    t.string   "telefone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "predios", :force => true do |t|
    t.string   "nome"
    t.integer  "andares"
    t.integer  "qtd_apart_andar"
    t.integer  "telefone"
    t.integer  "condominio_id"
    t.integer  "sindico_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "servico_tipo_servico", :id => false, :force => true do |t|
    t.integer "servico_id"
    t.integer "tipo_servico_id"
  end

  create_table "servicos", :force => true do |t|
    t.string   "nome"
    t.integer  "tipo_servico_id"
    t.text     "descricao"
    t.string   "endereco"
    t.string   "telefone"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
  end

  create_table "tipo_servicos", :force => true do |t|
    t.string   "nome"
    t.string   "slug"
    t.boolean  "categoria"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tipo_usuarios", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "usuario_apartamentos", :id => false, :force => true do |t|
    t.integer "usuario_id"
    t.integer "apartamento_id"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "nome"
    t.integer  "telefone"
    t.date     "data_nascimento"
    t.integer  "tamanho_familia"
    t.integer  "tipo_usuario_id"
    t.integer  "ultimo_aviso_visto"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "usuarios", ["email"], :name => "index_usuarios_on_email", :unique => true
  add_index "usuarios", ["reset_password_token"], :name => "index_usuarios_on_reset_password_token", :unique => true

end