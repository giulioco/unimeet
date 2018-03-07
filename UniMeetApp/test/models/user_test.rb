require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
  end
   test "valid user" do
     assert @user.valid?
   end
   test "invalid without first_name"do
     @user.first_name = nil
     refute @user.valid?, 'no first name present'
     assert_not_nil @user.errors[:first_name], 'no validation error for name present'

   end
   test "invalid without last_name"do
     @user.last_name = nil
     refute @user.valid?, 'no last name present'
     assert_not_nil @user.errors[:last_name], 'no validation error for name present'
   end

   test "invalid without email"do
     @user.email = nil
     refute @user.valid?, 'no email present'
     assert_not_nil @user.errors[:email]
   end

   test "ucsc email"do
     assert(@user.email['ucsc.edu'])
   end
end
