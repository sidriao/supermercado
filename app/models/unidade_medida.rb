class UnidadeMedida < ActiveRecord::Base
  attr_accessible :nome
  has_many :produtos

  #Validacoes
  validates :nome, :presence => true, :length => { :maximum => 100}, :uniqueness => true
end
