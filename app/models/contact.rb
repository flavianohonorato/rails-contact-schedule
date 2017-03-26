class Contact < ApplicationRecord
	#add validation
	validates :name, :email, :phone, presence: true
end
