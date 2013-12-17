class Product < ActiveRecord::Base
  SOURCE_TYPES = {
  	:moon_1 => "Moon Tier 1",
  	:moon_2 => "Moon Tier 2",
  	:moon_3 => "Moon Tier 3",
  	:moon_4 => "Moon Tier 4",
  	:planet_1 => "Planet Tier 1",
  	:planet_2 => "Planet Tier 2",
  	:planet_3 => "Planet Tier 3",
  	:planet_4 => "Planet Tier 4",
  	:ore => "Asteroid Unrefined",
  	:mineral => "Asteroid Refined",
  	:gas => "Gas Tier 1",
  	:gas_refined => "Gas Refined",
  	:blueprint => "Blueprint",
  	:reaction => "Reaction"
  }
  enum :source, SOURCE_TYPES
  validates_presence_of :name

  before_validation :set_default_source

  def set_default_source
  	self.source = :mineral if self.source.blank?
  end
end
