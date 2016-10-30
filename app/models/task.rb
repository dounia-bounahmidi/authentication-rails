class Task < ApplicationRecord

	belongs_to :list 

	def completed? 
		!completed_at.blank? 
	end 
end
