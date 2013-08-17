class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :nome
      t.integer :unidade_medida_id
      t.foreign_key :unidade_medidas
      t.integer :grupo_id
      t.foreign_key :grupos

      t.timestamps
    end
    add_index :produtos, :nome, :unique => true
    add_index :produtos, :unidade_medida_id
    add_index :produtos, :grupo_id
  end
end
