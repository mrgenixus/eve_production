class Blueprint < Product
  attr_accessible :name, :worth

  def set_default_source
  	self.source = :blueprint
  end
  default_scope where(:source => :blueprint)
end
