class Monster < ActiveRecord::Base
	belongs_to :user
	belongs_to :team
	
	MONSTER_TYPES = ["fire", "water", "earth", "electric", "wind"]
end
