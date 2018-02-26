module ActivitiesHelper
	def display_image(size)
      image_tag(@activity.image.url(size))
  end
end