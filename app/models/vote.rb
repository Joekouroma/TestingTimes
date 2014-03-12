class Vote < ActiveRecord::Base


	# let the vote know about the story its attached to ]
	# and let the story keep track of how many votes it has 

	belongs_to :story, counter_cache: true

	# what we want to do is check that the ip address is unique for that storie
	validates :ip_address, uniqueness: { scope: :story_id}

	# if we had just unqueness is true that would mean one vote across the site 
	# per ip address this way we can do one vote per story 


end
