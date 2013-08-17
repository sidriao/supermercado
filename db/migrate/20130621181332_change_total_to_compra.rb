class ChangeTotalToCompra < ActiveRecord::Migration
  def up
  	change_table :compras do |t|
      t.change :total, :decimal, {:precision => 18, :scale => 2, :null => false}
    end
  end

  def down
  	change_table :item_compras do |t|
      t.change :total, :float, {:precision => 2, :null => false}
    end
  end
end
