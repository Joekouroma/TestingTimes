#this is a for grabbing code

task scrape_reddit: :environment do 

	puts "hello mate"

	# this grabs the source code of reddit

	@raw_html = HTTParty.get("http://reddit.com")

	# lets turn the raw html into something we can pass
	@real_html  = Nokogiri::HTML(@raw_html)

	# in css we would style the title links using div siteTable a.title
	@real_html.css("div#siteTable a.title").each do |link|

		# this is similar ro the stories?index.html.erb view

		@story = Story.new
		@story.title = link.text
		@story.link = link[:href]
		@story.save
		
	end
	
end