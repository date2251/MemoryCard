class Ranking < ApplicationRecord
	validates :user_name, presence: true
end
