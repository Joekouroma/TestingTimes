class VotesController < ApplicationController

	def create

				# find the story you want to vote on 
				@story = Story.find(params[:story_id])

				# make a vote on the story with the users ip address
				@vote = @story.votes.new(ip_address: request.ip)

				# save the story if we have not voted before 
				if @vote.save

					# let the user know 
				flash[:sucess] = "you have created a vote"

				else

				# let the user know there can vote again
				flash[:error] = "you can't vote again"

				end

				

				# go back to the story page
				redirect_to story_path(@story)
		
			
	end
end
