module UsersHelper
  def full_name
    if @user.middle_name == ""
      @user.first_name + " " + @user.last_name
    else
      @user.first_name + " " + @user.middle_name + " " + @user.last_name
    end
  end
  
  def age
    if (@user.birthday != nil)
      (Date.today.strftime('%Y%m%d').to_i - @user.birthday.strftime('%Y%m%d').to_i) / 10000
    end
  end

  def display_image(size)
    if(current_user.image_file_size != nil)
      image_tag(current_user.image.url(size))
    end
  end
  
  def display_image_menu(size)
    if(current_user.image_file_size != nil)
      image_tag(current_user.image.url(size), :class => 'round-image-50') 
    else "My Account"
    end
  end
end
