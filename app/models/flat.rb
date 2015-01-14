class Flat < ActiveRecord::Base

has_many :votes


	validates :image, presence: true, uniqueness: true
	validates :location, presence: true
	validates :price, presence: true

	def upvotes_by_user(user)
		votes.where(user: user)
	end

	def thumbsup(user)
		votes.create!({ upvote: 1, user: user})
	end

	def killswitch(user)
		votes.create!({ upvote: -1, user: user})
	end

	def totalvotes(flat)
	end


	def self.next_flat_for_user(user)
		self.all.find { |flat| flat.upvotes_by_user(user).count == 0}
	end
end
 