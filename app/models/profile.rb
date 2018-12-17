class Profile < ApplicationRecord
	belongs_to :user

	validates :age, :lastname, :firstname, :avatar, presence: true

	validates :age, numericality: { only_integer: true }

	validate :in_range


 has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

	def in_range
		if (age != nil )
	inrange = (age > 18 && age < 65) 
		if  !inrange
			errors.add(:age, 'age must be in range 18 to 65 years')
			throw(:abort)
		end
	end
	end

end
