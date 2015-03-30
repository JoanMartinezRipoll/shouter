module Following
  extend ActiveSupport::Concern

  included do
    has_many :followed_users_relationships,
      foreign_key: :follower_id,
      class_name: 'FollowingRelationship'
    has_many :followed_users, through: :followed_users_relationships

    has_many :follower_relationships,
      foreign_key: :followed_user_id,
      class_name: 'FollowingRelationship'
    has_many :followers, through: :follower_relationships
  end

  module ClassMethods
    #add some class methods here
  end


  def following? user
    followed_user_ids.include? user.id
  end

  def follow user
    followed_users << user
  end

  def unfollow user
    followed_users.delete(user)
  end
end
