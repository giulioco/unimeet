module ActivityCardsHelper
	def activity
		if @activity_card.activity_id != ""
			@activity = Activity.find(@activity_card.activity_id)
		end
	end
end
