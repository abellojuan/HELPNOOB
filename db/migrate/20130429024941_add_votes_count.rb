class AddVotesCount < ActiveRecord::Migration
  def up
  	add_column :posts, :votes_count, :integer, :default => 0
  	Post.find_each do |post|
      post.update_attribute(:votes_count, post.vote_number)
      post.save
    end
  end

  def down
  	remove :posts, :votes_count
  end
end
