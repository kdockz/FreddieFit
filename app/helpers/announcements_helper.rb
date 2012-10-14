module AnnouncementsHelper
	def show_date(start_date)

		if start_date.nil?
			return "TBD"
		else 
			return start_date.strftime("%B %d, %Y" )
		end

	end

end
