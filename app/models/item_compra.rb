class ItemCompra < ActiveRecord::Base
  belongs_to :produto
  belongs_to :compra
  attr_accessible :preco, :quantidade, :compra_id, :produto_id, :produto_nome

  accepts_nested_attributes_for :produto

  #Validacoes
  validates_presence_of :preco, :quantidade, :produto_id, :compra_id

  after_save :calcula_total

  after_destroy :calcula_total

  def calcula_total
  	self.compra.total = 0
  	self.compra.item_compras.each do |item|
  		self.compra.total += (item.preco * item.quantidade)
  	end	
  	self.compra.save
  end 

  def produto_nome
    produto.nome if produto
  end

  def produto_nome=(name)
    self.produto = Produto.find_or_create_by_nome(name) unless name.blank?
  end
end
