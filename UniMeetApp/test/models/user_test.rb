require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
  end
   test "should get edit" do
     assert @user.valid?
   end
end
