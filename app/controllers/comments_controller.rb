class CommentsController < ApplicationController

	# this controller only needs new and create 
	# because we dont want useres to edit delete or vieew a list 

	def new

		# we need to find which story we're talking about
		# and we need to make a new comment on that story

		# we dont want the params id because {:id} because that is talking about a comment NOT A STORY

		# we can get the params id from the URL THROUGH 

		@story = Story.find(params[:story_id])
		@comment = @story.comments.new 
	end

		# actually create the comment on the story

	def create
		#  same line as in the "new"
		@story = Story.find(params[:story_id])
		@comment = @story.comments.new (comment_params)

		# just like with the story controller if the comment is saved then redirect 

		if @comment.save 
			flash[:success] ="your comment has been posted"
			redirect_to story_path(@story)
		else
			render "new"
		end
	end

	#  lets make a short cut for whitelisting our form data

	def comment_params
		# ensure that the body field is filled in case of hackers
		params.require(:comment).permit(:body)

		
	end

end
