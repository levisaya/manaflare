class Card < ActiveRecord::Base
	has_many :rulings
	has_many :printings
end
