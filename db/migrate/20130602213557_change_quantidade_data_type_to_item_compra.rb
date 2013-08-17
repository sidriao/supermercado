class ChangeQuantidadeDataTypeToItemCompra < ActiveRecord::Migration
  def up
  	change_table :item_compras do |t|
      t.change :quantidade, :float, {:precision => 3, :null => false}
    end
  end

  def down
  	change_table :item_compras do |t|
      t.change :quantidade, :integer
    end
  end
end
