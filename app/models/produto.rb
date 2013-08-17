class Produto < ActiveRecord::Base
  belongs_to :unidade_medida
  belongs_to :grupo

  attr_accessible :nome, :unidade_medida_id, :grupo_id, :produto_id

  #Validacoes
  validates_presence_of :nome, :grupo, :unidade_medida

end
