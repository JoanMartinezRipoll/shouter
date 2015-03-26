class CreateFollowingRelationships < ActiveRecord::Migration
  def change
    create_table :following_relationships do |t|
      t.references :follower, index: true
      t.references :followed_user, index: true

      t.timestamps null: false
    end
    add_foreign_key :following_relationships, :followers
    add_foreign_key :following_relationships, :followed_users
  end
end
