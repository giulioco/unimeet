module ActivitiesHelper
	def display_activity_image(activity, size, class_type)
      image_tag(activity.image.url(size), :class => class_type)
  end

  def activity_image_url(size)
    if @activity.image_file_size == nil
      default_activity_image_url 
    else @activity.image.url(size)
    end
  end
end