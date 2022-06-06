class Reply < ApplicationRecord
	belongs_to :comment
	validates_presence_of :user, :content
end
