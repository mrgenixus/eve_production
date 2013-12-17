class Blueprint < Product
  has_many :blueprints_components
  has_many :components, through: :blueprints_components

  def set_default_source
  	self.source = :blueprint
  end
  default_scope where(:source => :blueprint)
end
