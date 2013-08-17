class Supermercado < ActiveRecord::Base
  attr_accessible :id, :nome

  #Validacoes
  validates :nome, :presence => true, :length => { :maximum => 100}
end
