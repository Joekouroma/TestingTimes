class Comment < ActiveRecord::Base


		# let the comment know about the story its attached to 
		belongs_to :story

		# make sure the comment is not blank
		validates :body, presence: true


end
