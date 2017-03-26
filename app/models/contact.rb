class Contact < ApplicationRecord
	belongs_to :group
	#add validation
	validates :name, :email, :phone, presence: true

	# avatar
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "http://placehold.it/100x100&text=No+Image"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end