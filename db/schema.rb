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

ActiveRecord::Schema.define(:version => 20130621181332) do

  create_table "compras", :force => true do |t|
    t.date     "data",                                           :null => false
    t.decimal  "total",           :precision => 18, :scale => 2, :null => false
    t.integer  "supermercado_id"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "compras", ["supermercado_id"], :name => "index_compras_on_supermercado_id"

  create_table "grupos", :force => true do |t|
    t.string   "nome",       :limit => 100, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "grupos", ["nome"], :name => "index_grupos_on_nome", :unique => true

  create_table "item_compras", :force => true do |t|
    t.float    "quantidade",                                :null => false
    t.decimal  "preco",      :precision => 18, :scale => 2, :null => false
    t.integer  "produto_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "compra_id"
  end

  add_index "item_compras", ["produto_id"], :name => "index_item_compras_on_produto_id"

  create_table "produtos", :force => true do |t|
    t.string   "nome"
    t.integer  "unidade_medida_id"
    t.integer  "grupo_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "produtos", ["grupo_id"], :name => "index_produtos_on_grupo_id"
  add_index "produtos", ["nome"], :name => "index_produtos_on_nome", :unique => true
  add_index "produtos", ["unidade_medida_id"], :name => "index_produtos_on_unidade_medida_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "supermercados", :force => true do |t|
    t.string   "nome",       :limit => 100, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "supermercados", ["nome"], :name => "index_supermercados_on_nome", :unique => true

  create_table "unidade_medidas", :force => true do |t|
    t.string   "nome",       :limit => 100, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "unidade_medidas", ["nome"], :name => "index_unidade_medidas_on_nome", :unique => true

  create_table "users", :force => true do |t|
    t.string   "username",               :limit => 25, :default => "", :null => false
    t.string   "email",                  :limit => 50, :default => "", :null => false
    t.string   "encrypted_password",                   :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  add_foreign_key "compras", "supermercados", :name => "compras_supermercado_id_fk"

  add_foreign_key "item_compras", "compras", :name => "item_compras_compra_id_fk", :dependent => :delete
  add_foreign_key "item_compras", "produtos", :name => "item_compras_produto_id_fk"

  add_foreign_key "produtos", "grupos", :name => "produtos_grupo_id_fk"
  add_foreign_key "produtos", "unidade_medidas", :name => "produtos_unidade_medida_id_fk"

  add_foreign_key "users_roles", "roles", :name => "users_roles_role_id_fk"
  add_foreign_key "users_roles", "users", :name => "users_roles_user_id_fk"

end
