class CreateItemCompras < ActiveRecord::Migration
  def change
    create_table :item_compras do |t|
      t.integer :quantidade, :null => false
      t.float :preco, :precision => 2, :null => false
      t.integer :produto_id
      t.foreign_key :produtos
      t.timestamps
    end
    add_index :item_compras, :produto_id
  end
end
