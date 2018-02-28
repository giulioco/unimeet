module ActivitiesHelper
	def display_image(size)
      image_tag(@activity.image.url(size))
  end

  def activity_image_url(size)
    if @activity.image_file_size == nil
      default_activity_image_url 
    else @activity.image.url(size)
    end
  end
end