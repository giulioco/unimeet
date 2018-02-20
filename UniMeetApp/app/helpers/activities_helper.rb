module ActivitiesHelper
	    if(@activity.image_file_size != nil)
	      image_tag(@activity.image.url(size))
    end
  end
end
