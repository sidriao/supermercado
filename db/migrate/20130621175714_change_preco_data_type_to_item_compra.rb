class ChangePrecoDataTypeToItemCompra < ActiveRecord::Migration
  def up
  	change_table :item_compras do |t|
      t.change :preco, :decimal, {:precision => 18, :scale => 2, :null => false}
    end
  end

  def down
  	change_table :item_compras do |t|
      t.change :preco, :float, {:precision => 2, :null => false}
    end
  end
end
