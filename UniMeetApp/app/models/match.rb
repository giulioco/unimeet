class Match < ActiveRecord::Base
	belongs_to :user
	belongs_to :activity
	validates :user_id, uniqueness: { scope: :activity_id }
	validates :activity_id, uniqueness: { scope: :user_id }
  # acts_as_notifiable configures your model as ActivityNotification::Notifiable
  # with parameters as value or custom methods defined in your model as lambda or symbol.
  # The first argument is the plural symbol name of your target model.
  acts_as_notifiable :users,
    # Notification targets as :targets is a necessary option
    # Set to notify to author and users commented to the article, except match owner self
    targets: ->(match, key) {
      #[match.activity.project_owner_id] + 
      ([match.user]).uniq
    },
    tracked: true,
    # Path to move when the notification is opened by the target user
    # This is an optional configuration since activity_notification uses polymorphic_path as default
    notifiable_path: :article_notifiable_path
  def article_notifiable_path
    authenticated_root_path
  end
end