module UsersHelper
  def full_name
    if @user.middle_name == ""
      @user.first_name + " " + @user.last_name
    else
      @user.first_name + " " + @user.middle_name + " " + @user.last_name
    end
  end
end
