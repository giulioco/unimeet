module ActivitiesHelper
	def display_activity_image(size)
	    if(@activity.image_file_size != nil)
	      image_tag(@activity.image.url(size))
    end
  end
end
