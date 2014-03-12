class Story < ActiveRecord::Base


	# lets make the code know the realsionship between story and comment 

	has_many :comments 

	 # add another realtionship between stories and votes 

	 has_many :votes


	# lets make sure our data in our database is exactly what we wnat it to be 

	validates :title, presence: true, 
		length: { minimum: 5, message: "must be over 5 characters long" }

	validates :link, presence: true, uniqueness: true
	 # validates is a method 
	 # :title is a symbol because it does not change within the code 
	 # {presence: trues} is a hash 





end
