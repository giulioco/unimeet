require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  def setup
    @activity = activities(:one)
  end
   test "invlaid without name" do
     @activity.name = nil
     refute @activity.valid?, 'activity not valid without a name'
     assert_not_nil @activity.errors[:name], 'no validation error for name'
   end

   test "invalid without description"do
     @activity.description = nil
     refute @activity.valid?, 'activity not valid without a description'
     assert_not_nil @activity.errors[:name], 'no validation error for description'
   end


end
