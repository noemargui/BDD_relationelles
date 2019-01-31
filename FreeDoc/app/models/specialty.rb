class Specialty < ApplicationRecord
	has_many :diplomas
	has_many :doctors, through: :diplomas
end