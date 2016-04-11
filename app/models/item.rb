class Item < ActiveRecord::Base
	validates :unit_type, inclusion: { in: %w(Volume Weight Piece),
    	message: "%{unit_type} is not a valid unit type" }
    validate :compatible_units

	def self.unit_types
		%w{Volume Weight Piece}
	end

	def self.unit_options
		%w{L ml foz gal Kg g Lb oz Pz}
	end

	def compatible_units
		if unit_type == "Volume"
			unless %w{L ml foz gal}.include? unit
				errors.add(:unit, "Please select a compatible unit with #{unit_type}")
			end				
		elsif unit_type == "Weight"
			unless %w{Kg g Lb oz}.include? unit
				errors.add(:unit, "Please select a compatible unit with #{unit_type}")				
			end
		elsif unit_type == "Piece" 
			unless %w{Pz}.include? unit
				errors.add(:unit, "Please select a compatible unit with #{unit_type}")				
			end
		else
			errors.add(:unit, "Please select a compatible unit type")
		end
	end
end
