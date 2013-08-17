class CreateCompras < ActiveRecord::Migration
  def change
    create_table :compras do |t|
      t.date :data, :null => false
      t.float :total, :precision => 2, :null => false
      t.integer :supermercado_id
      t.foreign_key :supermercados

      t.timestamps
    end
    add_index :compras, :supermercado_id
  end
end
