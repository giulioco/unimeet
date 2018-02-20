module ActivitiesHelper
	def display_image(size)
      image_tag(@user.image.url(size))
    end
end