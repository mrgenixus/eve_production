class BlueprintsComponent < ActiveRecord::Base
  belongs_to :blueprint
  belongs_to :component
end