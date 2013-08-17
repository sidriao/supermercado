class Compra < ActiveRecord::Base
  belongs_to :supermercado
  has_many :item_compras, :dependent => :destroy

  accepts_nested_attributes_for :item_compras, :allow_destroy => true

  attr_accessible :data, :total, :supermercado_id, :item_compras_attributes, :supermercado, :supermercado_nome

  #Validacoes
  validates_presence_of :data, :supermercado

  def supermercado_nome
    supermercado.nome if supermercado
  end

  def supermercado_nome=(name)
    self.supermercado = Supermercado.find_or_create_by_nome(name) unless name.blank?
  end

end
