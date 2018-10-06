class Siniestro < ApplicationRecord
	belongs_to :aseguradora
	belongs_to :cliente
	belongs_to :usuario
	has_one :auto


end