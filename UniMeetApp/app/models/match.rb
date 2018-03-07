require 'render_anywhere'
class Match < ActiveRecord::Base
  include RenderAnywhere
	belongs_to :user
	belongs_to :activity
  cattr_accessor :current_user
	validates :user_id, uniqueness: { scope: :activity_id }
	validates :activity_id, uniqueness: { scope: :user_id }
  # acts_as_notifiable configures your model as ActivityNotification::Notifiable
  # with parameters as value or custom methods defined in your model as lambda or symbol.
  # The first argument is the plural symbol name of your target model.
  acts_as_notifiable :users,
    # Notification targets as :targets is a necessary option
    # Set to notify to author and users commented to the article, except match owner self
    targets: ->(match, key) {
      ([User.find_by(id: match.activity.project_owner_id)]+[match.user]).uniq
    },
    tracked: true,
    # Path to move when the notification is opened by the target user
    # This is an optional configuration since activity_notification uses polymorphic_path as default
    notifiable_path: :article_notifiable_path
  def article_notifiable_path
    activity = Activity.find_by(id: self.activity_id) 
    matched_user = User.find_by(id: self.user_id) 
    if self.user_id == current_user.id
      #authenticated_root_path
      render :partial => '/activities/activity_card', locals: { activity: activity }, :remote => true
    else
      authenticated_root_path 
    end
  end
end