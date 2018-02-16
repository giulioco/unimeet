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
end
