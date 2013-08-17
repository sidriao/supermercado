class AddCompraIdToItemCompra < ActiveRecord::Migration
  def change
  	add_column :item_compras, :compra_id, :integer
  	add_foreign_key(:item_compras, :compras, dependent: :delete)
  end
end
