TestingTimes::Application.routes.draw do

  
	# active admin added its own URL's to the site 
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # I want to set up all of the url's for the stories controller
  # this is a short cut for adding 7 different actions
  # REST is a way to alter and view data, the 7 actions are
  # index, show, new, create, edit,update, destroy
  # asymbol is a veriable that does not change! : 

  resources :stories do

  	# inside the stories, we have a nested resource whic is a relasionship
  	# between stories and comments. 
  	resources :comments 

    # inside the stories we have another nested resource which is a relationship between stories and votes
    resources :votes
  	
  end

  #new_story_path  --> stories#new
  #edit_story_path --> tories#edit
  #story_path --> stories#show
  # stories_path --> stories#index


  # new_comments_path   --> commentss#new
  # edit_comment_path --> commentss#edit
  #story_comment_path --> commentssshow
  # story_comments_path --> commentss#index



  # set up my home page to go to the stories controller
  # and show the index page 
  root "stories#index"

end
