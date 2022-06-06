class Comment < ApplicationRecord
	belongs_to :post
	has_many :replies
	validates_presence_of :name, :comment
end
