class StoriesController < ApplicationController

	# To add a page to my site lets add
	# a index page/home page (this is an action)

	def index
		#this is all the code for the index page 
		@username = "Joe"

		#to make a list, we use square brackets quotes means when the page is refreshed content will not change
		#@stories = ["Google", "Facebook", "Twitter", "linklin", "Foursquare"]
		#now we want to get our data from teh database, (to find all from database)
		# if the order by create_at desc
		# elese just do the useal stuff


		if params[:sort] == "recent"
			# if true sort by most recent 
			@stories = Story.order("created_at desc")

		elsif params[:filter] == "featured"
			
			@stories = Story.where(is_featured: true).order("title asc")


		else

			# sort by most voted
			@stories = Story.order("votes_count desc, created_at desc")
		end

		  # @stories = Story.all 
		

		# 
	end 

	#show me  an individual story page
	def show
		@story = Story.find(params[:id])
		
	end

	#this is going to be 'adding a new story from' page 
	#params id is from the url e.g if /storires/7 then param[:id] = 7

	def new 
		# make @story be a blank story ready to be filled in
		@story = Story.new 
		
	end


	# new and create work together as a pair the create action actully adds to the database 

	def create

		#Lets make @story be a blank story with fields filled in
		#@story = Story.new(title: "test", description: "test", link: "http://anything.com")
		 

		@story = Story.new(story_params)


		#actully save this story to the database
		# if they dont pass , show the form with some errors 

		if @story.save



			#lets add a notification to the user to let them know it has been saved to the database
			flash[:sucess] = "well done! you story has been submitted"

			# Lets make this go back to the homepage
			redirect_to root_path
		else
			# if the story does not save, do this 
			# show the new.html.erb form with errors
			# new will keep user on the new page and keep information in the form 
			render "new"

		end 
	end

	#i want to show the edit on an individual page 

	def edit
		#lets find the story based on the url
		@story = Story.find(params[:id])

		
	end


	#i want to update the database with the updated data
	def update
		@story = Story.find(params[:id])

		# update the record with form data IF TIT VALIDATES
		if 	
			@story.update(story_params)

			flash[:sucess] ='updated well done'

			# lets make this go back to the story page/show page
			redirect_to story_path(@story)

		else 
			# if it does not update, shoe the edit form with errors
			render "edit"
		end
	end

	# lets destroy this story

	def destroy
		@story = Story.find(params[:id])

		# destroy the record with form data 
		@story.destroy

		flash[:sucess] = "its gone bye bye"

		# lets make this go back to the home page/show page
		redirect_to root_path(@story)
		
	end

	#I want to get the right data from the form

	def story_params
		# only get the title, desc and link from the story params
		params.require(:story).permit(:title, :description, :link)
		
	end
end
