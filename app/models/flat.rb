class Flat < ActiveRecord::Base

has_many :votes


	validates :image, presence: true, uniqueness: true
	validates :location, presence: true
	validates :price, presence: true

#	def self.vote(vote)
#		self.where("image LIKE ?", "%#{vote}").first
#	end

end
